defmodule BunsanUsersUmbrella.Application do
  @moduledoc """
  The BunsanUsersUmbrella Application Service.

  The bunsan_users_umbrella system business domain lives in this application.

  Exposes API to clients such as the `BunsanUsersUmbrellaWeb` application
  for use in channels, controllers, and elsewhere.
  """
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    Supervisor.start_link([
      supervisor(BunsanUsersUmbrella.Repo, []),
    ], strategy: :one_for_one, name: BunsanUsersUmbrella.Supervisor)
  end
end
