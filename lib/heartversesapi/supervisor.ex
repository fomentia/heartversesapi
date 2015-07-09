defmodule Heartversesapi.Supervisor do
  use Supervisor

  def start_link do
    :supervisor.start_link(__MODULE__, [])
  end

  @ecto_repo Repo
  @endpoint Heartversesapi.Endpoint

  def init([]) do
    # Adding repo to be sent to supervise
    tree = [
      worker(@ecto_repo, []),
      worker(@endpoint, []),
    ]

    supervise(tree, strategy: :one_for_one)
  end
end
