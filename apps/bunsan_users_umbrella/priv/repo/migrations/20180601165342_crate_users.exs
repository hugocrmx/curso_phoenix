defmodule BunsanUsersUmbrella.Repo.Migrations.CrateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :age, :integer
      add :email, :string
      timestamps()
    end

  end
end
