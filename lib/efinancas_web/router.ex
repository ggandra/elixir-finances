defmodule EfinancasWeb.Router do
  use EfinancasWeb, :router

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
    plug Guardian.Plug.Pipeline, module: Efinancas.Guardian, error_handler: Efinancas.Auth.ErrorHandler
    plug Guardian.Plug.VerifyHeader, realm: "Bearer"
    plug Guardian.Plug.LoadResource
    plug Guardian.Plug.EnsureAuthenticated
  end

  scope "/", EfinancasWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", EfinancasWeb do
    pipe_through :api

    post "/auth/login", AuthController, :login
    post "/companies/create", CompaniesController, :create
  end

  scope "/api", EfinancasWeb do
    pipe_through([:api, :auth])

    post "/cash_flows/create", CashFlowsController, :create
    get "/cash_flows/get_by_month/:year/:month", CashFlowsController, :show
    put "/cash_flows/update/:id", CashFlowsController, :update
    delete "/cash_flows/delete/:id", CashFlowsController, :delete
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: EfinancasWeb.Telemetry
    end
  end
end
