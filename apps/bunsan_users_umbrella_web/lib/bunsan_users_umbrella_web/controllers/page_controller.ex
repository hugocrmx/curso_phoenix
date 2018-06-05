defmodule BunsanUsersUmbrellaWeb.PageController do
  use BunsanUsersUmbrellaWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
