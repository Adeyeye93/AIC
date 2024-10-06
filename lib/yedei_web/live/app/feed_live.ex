defmodule YedeiWeb.App.FeedLive do
  use YedeiWeb, :live_view


  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(app: true)
      |> assign(view: "profile")
    {:ok, socket}
  end
end
