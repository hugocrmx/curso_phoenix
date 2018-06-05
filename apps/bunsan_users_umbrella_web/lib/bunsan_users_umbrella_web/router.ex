defmodule BunsanUsersUmbrellaWeb.Router do
  use BunsanUsersUmbrellaWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", BunsanUsersUmbrellaWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", BunsanUsersUmbrellaWeb do
     pipe_through :api
     resources "/users",  UserController, only: [:index, :show, :create]

    # post "/user", UserController, :create
    # get "/users", UserController, :index
    # get "/users/:id", UserController, :show
   end
end
