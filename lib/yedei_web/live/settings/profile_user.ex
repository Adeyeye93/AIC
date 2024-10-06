defmodule YedeiWeb.Settings.ProfileUser do
  use YedeiWeb, :live_component

    alias Yedei.Profile
    alias Yedei.Profile.Owner

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <:subtitle>Use this form to manage owner records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="owner-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:Role]} type="text" label="Role" />
        <.input field={@form[:Bio]} type="text" label="Bio" />
        <.input field={@form[:location]} type="text" label="Location" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Owner</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
     |> assign(:view, "profile")
     |> assign_new(:form, fn ->
       to_form(Profile.change_owner(%Owner{}))
     end)}
  end

  @impl true
  def handle_event("validate", %{"owner" => owner_params}, socket) do
    changeset = Profile.change_owner(%Owner{}, owner_params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event("save", %{"owner" => owner_params}, socket) do
    save_owner(socket, socket.assigns.action, owner_params)
  end

  defp save_owner(socket, :edit, owner_params) do
    case Profile.update_owner(socket.assigns.owner, owner_params) do
      {:ok, owner} ->
        notify_parent({:saved, owner})

        {:noreply,
         socket
         |> put_flash(:info, "Owner updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp save_owner(socket, :new, owner_params) do
    case Profile.create_owner(owner_params) do
      {:ok, owner} ->
        notify_parent({:saved, owner})

        {:noreply,
         socket
         |> put_flash(:info, "Owner created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})

end
