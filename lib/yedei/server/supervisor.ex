defmodule Yedei.Server.Supervisor do
  use DynamicSupervisor

  def start_link(init_arg) do
    DynamicSupervisor.start_link(__MODULE__, init_arg, name: __MODULE__)
  end

  @impl true
  def init(_init_arg) do
    DynamicSupervisor.init(strategy: :one_for_one)
  end

  def start_email_verification(user_id) do
    DynamicSupervisor.start_child(__MODULE__, {Yedei.EmailVerificationServer, user_id})
  end
end
