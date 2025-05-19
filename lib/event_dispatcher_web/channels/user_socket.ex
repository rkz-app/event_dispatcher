defmodule EventDispatcherWeb.UserSocket do
  use Phoenix.Socket

  channel "room:*", EventDispatcherWeb.RoomChannel
  channel "global", EventDispatcherWeb.RoomChannel

  @impl true
  def connect(_params, socket, _info), do: {:ok, socket}

  @impl true
  def id(_socket), do: nil
end
