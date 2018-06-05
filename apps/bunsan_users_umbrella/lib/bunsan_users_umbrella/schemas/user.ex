defmodule BunsanUsersUmbrella.User do
  @moduledoc """
  Schema for user representation
  """
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  schema "users" do
    field :name, :string
    field :age, :integer
    field :email, :string
    timestamps()
  end

  def signup_changeset(user = %BunsanUsersUmbrella.User{}, params) do
    user
      |> cast(params, [:name, :age, :email])
      |> validate_required([:name, :age, :email])
  end

  def save(changeset) do
    #Quien gestiona la conexion
    BunsanUsersUmbrella.Repo.insert(changeset)
  end

  def search(user_id) do
    query = from u in BunsanUsersUmbrella.User,
            where: u.id == ^user_id,
            select: u

    BunsanUsersUmbrella.Repo.one(query)
  end

  def search_all do
    query = from u in BunsanUsersUmbrella.User,
            select: [u.name, u.age, u.email]

    BunsanUsersUmbrella.Repo.all(query)
  end


end
