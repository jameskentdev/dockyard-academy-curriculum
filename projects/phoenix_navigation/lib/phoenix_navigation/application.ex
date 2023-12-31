defmodule PhoenixNavigation.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      PhoenixNavigationWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:phoenix_navigation, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: PhoenixNavigation.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: PhoenixNavigation.Finch},
      # Start a worker by calling: PhoenixNavigation.Worker.start_link(arg)
      # {PhoenixNavigation.Worker, arg},
      # Start to serve requests, typically the last entry
      PhoenixNavigationWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PhoenixNavigation.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PhoenixNavigationWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
