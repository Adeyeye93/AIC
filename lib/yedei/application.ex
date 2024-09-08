defmodule Yedei.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      YedeiWeb.Telemetry,
      Yedei.Repo,
      {DNSCluster, query: Application.get_env(:yedei, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Yedei.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Yedei.Finch},
      # Start a worker by calling: Yedei.Worker.start_link(arg)
      # {Yedei.Worker, arg},
      # Start to serve requests, typically the last entry
      YedeiWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Yedei.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    YedeiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
