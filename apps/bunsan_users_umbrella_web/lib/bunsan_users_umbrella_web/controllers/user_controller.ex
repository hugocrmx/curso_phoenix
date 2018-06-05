defmodule BunsanUsersUmbrellaWeb.UserController do
  @moduledoc """
  Controller for Users
  """
  use BunsanUsersUmbrellaWeb, :controller
  alias BunsanUsersUmbrella.User

  def create(conn, user_params) do
    chg = User.signup_changeset(%User{}, user_params)
    case chg.valid? do
      true ->
        {:ok, user} =User.save(chg)
      conn
      |> put_status(201)
      |>  render("user.json", %{user: user})
      #json(%{user: %{name: user.name, age: user.age, email: user.email}})

      false->
        conn
        |> put_status(400)
        |> render("error.json", changeset: chg)

        #|> json(%{error: Ecto.Changeset.traverse_errors(chg,
        #            fn {msg, opts} ->
        #            Enum.reduce(opts, msg, fn {key, value}, acc ->
        #            String.replace(acc, "%{#{key}}", to_string(value))
        #              end)
        #            end
        #      )})
    end
  end

  def index(conn, _params) do
    users = User.search_all()
    conn
    |> put_status(200)
    |> json(%{users: users})
  end

  def show(conn, params) do
    user = User.search(params["id"])
    conn
    |> put_status(200)
    |> json(%{user: %{name: user.name, age: user.age, email: user.email}})
  end
end
