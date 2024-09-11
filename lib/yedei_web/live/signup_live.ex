defmodule YedeiWeb.SignupLive do
  use YedeiWeb, :live_component

  alias Yedei.Server.Supervisor
  alias Yedei.Account
  alias Yedei.Account.{User}

  def render(assigns) do
    ~H"""
      <div class="w-full h-full py-10 flex flex-row items-center justify-between">
        <%= if @signup == :signup do %>
        <div class="w-5/12 h-96 flex items-center flex-col justify-center">
          <svg xmlns="http://www.w3.org/2000/svg" class="w-24 h-24 text-gray-400" fill="currentColor" class="bi bi-shield-check" viewBox="0 0 16 16">
          <path d="M5.338 1.59a61 61 0 0 0-2.837.856.48.48 0 0 0-.328.39c-.554 4.157.726 7.19 2.253 9.188a10.7 10.7 0 0 0 2.287 2.233c.346.244.652.42.893.533q.18.085.293.118a1 1 0 0 0 .101.025 1 1 0 0 0 .1-.025q.114-.034.294-.118c.24-.113.547-.29.893-.533a10.7 10.7 0 0 0 2.287-2.233c1.527-1.997 2.807-5.031 2.253-9.188a.48.48 0 0 0-.328-.39c-.651-.213-1.75-.56-2.837-.855C9.552 1.29 8.531 1.067 8 1.067c-.53 0-1.552.223-2.662.524zM5.072.56C6.157.265 7.31 0 8 0s1.843.265 2.928.56c1.11.3 2.229.655 2.887.87a1.54 1.54 0 0 1 1.044 1.262c.596 4.477-.787 7.795-2.465 9.99a11.8 11.8 0 0 1-2.517 2.453 7 7 0 0 1-1.048.625c-.28.132-.581.24-.829.24s-.548-.108-.829-.24a7 7 0 0 1-1.048-.625 11.8 11.8 0 0 1-2.517-2.453C1.928 10.487.545 7.169 1.141 2.692A1.54 1.54 0 0 1 2.185 1.43 63 63 0 0 1 5.072.56"/>
          <path d="M10.854 5.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 7.793l2.646-2.647a.5.5 0 0 1 .708 0"/></svg>
          <h2 class="poppins-medium text-xl text-gray-200 mt-6 mb-12">Register For free</h2>
        </div>
        <div class="w-7/12 border-l-2 border-solid bg-box border-gray-700 dark:bg-gray-800 p-8">
          <h3 class="text-2xl font-semibold text-white">Register</h3>
          <div class="mt-12 flex flex-wrap sm:grid gap-6 grid-cols-2">
            <button class="w-full h-11 rounded-full px-6 transition focus:bg-gray-700 active:bg-gray-600 bg-gray-700">
              <div class="w-max mx-auto flex items-center justify-center space-x-4">
                <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="w-5 text-gray-100" viewBox="0 0 16 16">
                    <path d="M15.545 6.558a9.4 9.4 0 0 1 .139 1.626c0 2.434-.87 4.492-2.384 5.885h.002C11.978 15.292 10.158 16 8 16A8 8 0 1 1 8 0a7.7 7.7 0 0 1 5.352 2.082l-2.284 2.284A4.35 4.35 0 0 0 8 3.166c-2.087 0-3.86 1.408-4.492 3.304a4.8 4.8 0 0 0 0 3.063h.003c.635 1.893 2.405 3.301 4.492 3.301 1.078 0 2.004-.276 2.722-.764h-.003a3.7 3.7 0 0 0 1.599-2.431H8v-3.08z"/>
                  </svg>
                <span class="block w-max text-sm font-semibold tracking-wide  text-white">
                  With Google
                </span>
              </div>
            </button>

            <button class="w-full h-11 rounded-full px-6 transition focus:bg-gray-700 active:bg-gray-600 bg-gray-700">
              <div class="w-max mx-auto flex items-center justify-center space-x-4 text-white">
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  fill="currentColor"
                  class="w-5"
                  viewBox="0 0 16 16"
                >
                  <path d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.012 8.012 0 0 0 16 8c0-4.42-3.58-8-8-8z" />
                </svg>

                <span class="block w-max text-sm font-semibold tracking-wide text-white">
                  With Github
                </span>
              </div>
            </button>
          </div>

          <.simple_form
            for={@form}
            id="registration_form"
            phx-submit="save"
            phx-change="validate"
            method="post"
            phx-target={@myself}
            class="mt-10 space-y-8 text-white bg-transparent">
            <div>
              <div class="relative before:absolute before:bottom-0 before:h-0.5 before:left-0 before:origin-right focus-within:before:origin-left before:right-0 before:scale-x-0 before:m-auto before:bg-sky-400 dark:before:bg-sky-800 focus-within:before:!scale-x-100 focus-within:invalid:before:bg-red-400 before:transition before:duration-300">
                <.input
                  field={@form[:username]}
                  type="text"
                  placeholder="Your email or user name"
                  class="w-full bg-transparent pb-3  border-b dark:placeholder-gray-300 dark:border-gray-600 outline-none  invalid:border-red-400 transition"
                />
              </div>
            </div>

            <div>
              <div class="relative before:absolute before:bottom-0 before:h-0.5 before:left-0 before:origin-right focus-within:before:origin-left before:right-0 before:scale-x-0 before:m-auto before:bg-sky-400 dark:before:bg-sky-800 focus-within:before:!scale-x-100 focus-within:invalid:before:bg-red-400 before:transition before:duration-300">
                <.input
                  field={@form[:email]}
                  type="email"
                  placeholder="Your email"
                  class="w-full bg-transparent pb-3  border-b dark:placeholder-gray-300 dark:border-gray-600 outline-none  invalid:border-red-400 transition"
                  required
                />
              </div>
            </div>

            <div>
              <div class="relative before:absolute before:bottom-0 before:h-0.5 before:left-0 before:origin-right focus-within:before:origin-left before:right-0 before:scale-x-0 before:m-auto before:bg-sky-400 dark:before:bg-sky-800 focus-within:before:!scale-x-100 focus-within:invalid:before:bg-red-400 before:transition before:duration-300">
                <.input
                  field={@form[:password]}
                  type="password"
                  placeholder="Your password"
                  class="w-full bg-transparent pb-3  border-b dark:placeholder-gray-300 dark:border-gray-600 outline-none  invalid:border-red-400 transition"
                  required
                />
              </div>
            </div>


            <div>
            </div>
             <:actions>
                  <.button phx-disable-with="Creating account..." class="w-full bg-sky-400 h-11 flex items-center justify-center px-6 py-3 transition hover:bg-sky-600 focus:bg-sky-600 active:bg-sky-800">
                <span class="text-base font-semibold text-gray-900">Login</span>
              </.button>
              </:actions>
                <button type="reset" class="-mr-3 w-max">
                  <span class="text-sm poppins-light tracking-wide text-sky-600 dark:text-sky-400">
                    Forgot password ?
                  </span>
                </button>
              <button href="#" type="reset" class="-ml-3 w-max p-3">
                <span class="text-sm tracking-wide text-sky-600 dark:text-sky-400">
                  Create new account
                </span>
              </button>
          </.simple_form>
        </div>
        <% else %>
        <div class="w-7/12 bg-box border-gray-700 dark:bg-gray-800 p-8">
          <h3 class="text-2xl font-semibold text-white">Verify</h3>
          <form
            id="registration_form"
            phx-submit="verify_code"
            phx-target={@myself}
            class="mt-10 space-y-8 text-white bg-transparent">
            <div>
              <div class="relative before:absolute before:bottom-0 before:h-0.5 before:left-0 before:origin-right focus-within:before:origin-left before:right-0 before:scale-x-0 before:m-auto before:bg-sky-400 dark:before:bg-sky-800 focus-within:before:!scale-x-100 focus-within:invalid:before:bg-red-400 before:transition before:duration-300">
                <input
                  field=""
                  type="text"
                  id="code"
                  name="code"
                  placeholder="Your email or user name"
                  class="w-full bg-transparent pb-3  border-b dark:placeholder-gray-300 dark:border-gray-600 outline-none  invalid:border-red-400 transition"
                />
              </div>
            </div>
            <div>
            </div>
              <.button phx-disable-with="Verifying..." class="w-full bg-sky-400 h-11 flex items-center justify-center px-6 py-3 transition hover:bg-sky-600 focus:bg-sky-600 active:bg-sky-800">
                <span class="text-base font-semibold text-gray-900">Login</span>
              </.button>
          </form>
        </div>
        <% end %>
      </div>
    """
  end

  def update(assigns, socket) do
    if assigns.signup == :signup do
      changeset = User.confirm_changeset(%User{})

      socket =
        socket
        |> assign(assigns)
        |> assign(trigger_submit: false, check_errors: false)
        |> assign_form(changeset)

      {:ok, socket}
    else

      socket =
        socket
        |> assign(assigns)
        |> assign(trigger_submit: false, check_errors: false)

      {:ok, socket}
    end
  end

    def handle_event("save", %{"user" => user_params}, socket) do
    case Account.register_user(user_params) do
      {:ok, user} ->
        {:ok, _} =
          Supervisor.start_email_verification(user.id)
          %{vcode: code} = Yedei.EmailVerificationServer.generate_pin(user.id)
          Account.deliver_user_confirmation_pin(user, code)

        changeset = Account.change_user_registration(user)
        {:noreply,
         socket
         |> assign(trigger_submit: true)
         |> push_event("login_user", %{user: user_params})
         |> assign(signup: :pin)
         |> assign_form(changeset)
        }

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, socket |> assign(check_errors: true) |> assign_form(changeset)}
    end
  end

  def handle_event("validate", %{"user" => user_params}, socket) do
    changeset = Account.change_user_registration(%User{}, user_params)
    {:noreply, assign_form(socket, Map.put(changeset, :action, :validate))}
  end

  def handle_event("verify_code", %{"code" => code}, socket) do
    user = socket.assigns.form.data.id
    case Yedei.EmailVerificationServer.verify_code(user, code) do
      %{status: :success, msg: msg} ->
        socket =
          socket
          |> push_event("flash", %{msg: msg})
          |> push_navigate(to: "/")

        {:noreply, socket}

      %{
         status: :expired,
         msg: msg
       } ->
        socket =
          socket
          |> assign(:error_message, msg)
          |> push_event("flash", %{msg: msg})
        {:noreply, socket}

      %{status: :wrong, msg: msg} ->
        socket =
          socket
          |> assign(:error_message, msg)
          |> push_event("flash", %{msg: msg})
        {:noreply, socket}
    end
  end

  defp assign_form(socket, %Ecto.Changeset{} = changeset) do
    form = to_form(changeset, as: "user")

    if changeset.valid? do
      assign(socket, form: form, check_errors: false)
    else
      assign(socket, form: form)
    end
  end
end
