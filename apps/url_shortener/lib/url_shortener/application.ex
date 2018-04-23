defmodule US.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    import Supervisor.Spec
    
    children = [
      # Starts a worker by calling: US.Worker.start_link(arg)
      # {US.Worker, arg},
      supervisor(US.Repo, [])
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: US.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
