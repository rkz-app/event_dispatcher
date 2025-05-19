defmodule EventDispatcherWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :event_dispatcher

  plug CORSPlug, origin: "*"

  socket "/socket", EventDispatcherWeb.UserSocket,
    websocket: true,
    longpoll: false

  plug Plug.RequestId
  plug Plug.Telemetry, event_prefix: [:phoenix, :endpoint]

  plug Plug.Parsers,
    parsers: [:json],
    json_decoder: Phoenix.json_library()

  plug EventDispatcherWeb.Router
end
