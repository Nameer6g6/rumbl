defmodule Rumbl.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Start the Ecto repository
      Rumbl.Repo,
      # Commented out the rest since
      # We are using Umebrella to manage it

      # Start the endpoint when the application starts
      # RumblWeb.Endpoint,
      # Starts a worker by calling: Rumbl.Worker.start_link(arg)
      # {Rumbl.Worker, arg},
      # RumblWeb.Presence
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Rumbl.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
