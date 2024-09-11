defmodule Yedei.EmailVerificationServer do
  use GenServer

  def start_link(user_id) do
    GenServer.start_link(__MODULE__, %{:user_id => user_id, :vcode => "", :expired => false, :used => false}, name: via_tuple(user_id))
  end

  def verify_code(user_id, code) do
    GenServer.call(via_tuple(user_id), {:verify_code, code})
  end

  def generate_pin(user_id) do
    GenServer.call(via_tuple(user_id), :generate_pin)
  end

  defp via_tuple(user_id), do: {:via, Registry, {Yedei.EmailVerificationRegistry, user_id}}

  @impl true
  def init(init_arg) do
    {:ok, init_arg}
  end

  @impl true
  def handle_call(:generate_pin, _from, state) do
    pin =
      Enum.take_random(0..9, 6)
      |> Enum.join()
    new_state = Map.put(state, :vcode, pin)
    timer()

    {:reply, new_state, new_state}
  end

  @impl true
  def handle_call({:verify_code, pin}, _from, %{:vcode => code, :expired => expired} = state) do
    cond do
    expired ->
      {:reply,
       %{
         status: :expired,
         msg: "Your code is expired, Please click resend to try again"
       }, state}

    code == pin ->
      new_state = state |> Map.put(:vcode, "") |> Map.put(:used, true)
      {:reply, %{status: :success, msg: "Your Email has been verified"}, new_state}

    true ->
      {:reply, %{status: :wrong, msg: "Wrong code. Please try again."}, state}
  end
end

  @impl true
  def handle_info(:time_up, state) do
    new_state = Map.put(state, :expired, true)

    {:noreply, new_state}
  end
  defp timer do
    Process.send_after(self(), :time_up, :timer.minutes(2))
  end
end
