defmodule  BunsanUsersUmbrella.UserTest do

  use BunsanUsersUmbrella.DataCase

  setup  do
    user = %BunsanUsersUmbrella.User{}
    user_chg =  BunsanUsersUmbrella.User.signup_changeset(user, %{"name" => "Julio", "age" => 33, "email" => "julio@mail.com"})
    stored_user = BunsanUsersUmbrella.Repo.insert!(user_chg)
    {:ok, user: stored_user}
  end

  test "create user succesfully" do
    user = %BunsanUsersUmbrella.User{}
    changeset = BunsanUsersUmbrella.User.signup_changeset(user, %{"name" => "Misael", "age" => 33, "email" => "misa@mail.com"})
    assert changeset.valid? == true
  end

  test "create user unsuccesfully" do
    user = %BunsanUsersUmbrella.User{}
    changeset = BunsanUsersUmbrella.User.signup_changeset(user, %{"name" => "Misael", "age" => "A", "email" => "misa@mail.com"})
    assert changeset.valid? == false
  end

  test "search user sucessfully", %{user: user} do
    BunsanUsersUmbrella.User.search(user.id)
    assert user.name == "Julio"
  end

  test "search all users" do
    users = BunsanUsersUmbrella.User.search_all()
    assert users != []
  end
end
