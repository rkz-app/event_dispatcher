defmodule EventDispatcherWeb.DispatchController do
  use EventDispatcherWeb, :controller

  require Logger

  def create(conn, %{"event" => event, "data" => data} = params)
      when is_binary(event) and is_map(data) do

    topic = case params["room"] do
      nil -> "global"
      room when is_binary(room) -> "room:" <> room
      _ -> return_invalid(conn, "Room must be a string")
    end

    require Logger
    Logger.info("Broadcasting event=#{inspect(event)} to topic=#{inspect(topic)} with data=#{inspect(data)}")
    EventDispatcherWeb.Endpoint.broadcast(topic, event, data)
    json(conn, %{ok: true})
  end

  def create(conn, _),
    do: return_invalid(conn, "Invalid payload")

  defp return_invalid(conn, msg) do
    conn
    |> put_status(:bad_request)
    |> json(%{error: msg})
  end
end
