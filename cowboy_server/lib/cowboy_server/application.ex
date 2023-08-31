defmodule CowboyServer.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: CowboyServer.Worker.start_link(arg)
      # {CowboyServer.Worker, arg}

      {Task, fn -> CowboyServer.Server.start(5050) end}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: CowboyServer.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
