defmodule YedeiWeb.Nav.SettingLive do
  use YedeiWeb, :live_component

  def render(assigns) do
    ~H"""
      <div class="">
    <div class="mx-2 mt-8 space-y-4">
    <.link patch={~p"/#{@current_user.username}/settings"}>
      <button
        class="flex w-full flex-col gap-y-2 rounded-lg px-3 py-2 text-left transition-colors duration-200 hover:bg-slate-200 focus:outline-none dark:hover:bg-slate-800"
      >
        <h1
          class="text-sm font-medium capitalize text-slate-700 dark:text-slate-200"
        >
          Settings
        </h1>
      </button>
      </.link>

      <.link patch={~p"/#{@current_user.username}/profile"}>
      <button
        class="flex w-full flex-col gap-y-2 rounded-lg bg-slate-200 px-3 py-2 text-left transition-colors duration-200 focus:outline-none dark:bg-slate-800"
      >
        <h1
          class="text-sm font-medium capitalize text-slate-700 dark:text-slate-200"
        >
          Profile
        </h1>
      </button>
      </.link>
      <button
        class="flex w-full flex-col gap-y-2 rounded-lg px-3 py-2 text-left transition-colors duration-200 hover:bg-slate-200 focus:outline-none dark:hover:bg-slate-800"
      >
        <h1
          class="text-sm font-medium capitalize text-slate-700 dark:text-slate-200"
        >
          How to create ERP Diagram
        </h1>
      </button>
      <button
        class="flex w-full flex-col gap-y-2 rounded-lg px-3 py-2 text-left transition-colors duration-200 hover:bg-slate-200 focus:outline-none dark:hover:bg-slate-800"
      >
        <h1
          class="text-sm font-medium capitalize text-slate-700 dark:text-slate-200"
        >
          API Scaling Strategies
        </h1>
      </button>
    </div>
    </div>
    """
  end

  def update(assigns, socket) do
    {:ok, assign(socket, assigns)}
  end
end
