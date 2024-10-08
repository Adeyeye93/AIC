defmodule YedeiWeb.UserSettingsLive do
  use YedeiWeb, :live_view


  alias Yedei.Profile
  alias Yedei.Profile.Owner

  @impl true
  def render(assigns) do
    ~H"""
        <%= case @live_action do %>
        <% :setting-> %>
        <.live_component module={YedeiWeb.Settings.Settings} id={:setting} current_user={@current_user} />
        <% :profile -> %>
        <.live_component module={YedeiWeb.Settings.ProfileUser} id={:profile} current_user={@current_user} owner={@current_user.id} />
        <% end %>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(%{:app =>  true, :view => "setting"})
      |> stream(socket, :owners, Profile.list_owners())

    {:ok, socket}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Owner")
    |> assign(:owner, Profile.get_owner!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Owner")
    |> assign(:owner, %Owner{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Owners")
    |> assign(:owner, nil)
  end
end
