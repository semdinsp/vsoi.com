defmodule Vsoi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      VsoiWeb.Telemetry,
      Vsoi.Repo,
      {DNSCluster, query: Application.get_env(:vsoi, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Vsoi.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Vsoi.Finch},
      # Start a worker by calling: Vsoi.Worker.start_link(arg)
      # {Vsoi.Worker, arg},
      # Start to serve requests, typically the last entry
      VsoiWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Vsoi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    VsoiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
