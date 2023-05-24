defmodule UserPointsApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      UserPointsApi.Repo,
      # Start the Telemetry supervisor
      UserPointsApiWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: UserPointsApi.PubSub},
      # Start the Endpoint (http/https)
      UserPointsApiWeb.Endpoint,
      # Start a worker by calling: UserPointsApi.Worker.start_link(arg)
      # {UserPointsApi.Worker, arg}
      UserList
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: UserPointsApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    UserPointsApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
