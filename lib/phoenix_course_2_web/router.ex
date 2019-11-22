defmodule PhoenixCourse2Web.Router do
  use PhoenixCourse2Web, :router

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

  pipeline :auth do
    plug PhoenixCourse2Web.GuardianPipeline
  end

  pipeline :ensure_auth do
    plug Guardian.Plug.EnsureAuthenticated
  end

  # public routes
  scope "/", PhoenixCourse2Web do
    pipe_through :browser

    get "/register", RegisterController, :new
    post "/register", RegisterController, :create
    get "/login", LoginController, :new
    post "/login", LoginController, :create
  end

  # private routes
  scope "/", PhoenixCourse2Web do
    pipe_through [:browser, :auth, :ensure_auth]
    get "/", PageController, :index
    post "/logout", LoginController, :logout
    resources "/category", CategoryController
  end

  # Other scopes may use custom stacks.
  # scope "/api", PhoenixCourse2Web do
  #   pipe_through :api
  # end
end
