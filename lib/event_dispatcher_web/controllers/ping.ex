defmodule EventDispatcherWeb.PingController do
  use EventDispatcherWeb, :controller

  require Logger

  def index(conn, _params) do
    require Logger
    Logger.info("Health check")
    json(conn, %{ok: true})
  end


end
