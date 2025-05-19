defmodule EventDispatcherWeb.Router do
  use EventDispatcherWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug EventDispatcherWeb.Plugs.ApiKeyAuth
  end

  scope "/", EventDispatcherWeb do
    get "/ping", PingController, :index

    pipe_through :api
    post "/dispatch", DispatchController, :create
  end
end
