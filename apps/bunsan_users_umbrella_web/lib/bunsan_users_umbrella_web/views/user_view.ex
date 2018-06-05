defmodule BunsanUsersUmbrellaWeb.UserView do
  use BunsanUsersUmbrellaWeb, :view

  def translate_errors(changeset) do
    Ecto.Changeset.traverse_errors(changeset, &translate_error/1)
  end

  def render("user.json", %{user: user}) do
    %{user_view: %{age: user.age, name: user.name, email: user.email}}
  end

  def render("error.json", %{changeset: changeset}) do
    # When encoded, the changeset returns its errors
    # as a JSON object. So we just pass it forward.
    %{errors: translate_errors(changeset)}
  end
end
