defmodule YedeiWeb.Control.HomeLive do
  use YedeiWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, page_title: :Yedei)}
  end

  def handle_event("video", _unsigned_params, socket) do
    socket =
      socket
      |> push_navigate(to: "/video")
      |> push_event("page-patch", %{})

      {:noreply, socket}
  end

   def handle_params(param, _uri, socket) do
    {:noreply, action(socket, socket.assigns.live_action, param)}
  end

  def action(socket, :home, _param) do
    assign(socket, page_title: "Welcome")
  end

  def action(socket, :signup, _param) do
    assign(socket, page_title: "Register")
  end

  def action(socket, :login, _param) do
    assign(socket, page_title: "Login")
  end

end
