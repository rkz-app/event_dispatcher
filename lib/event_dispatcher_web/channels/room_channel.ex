defmodule EventDispatcherWeb.RoomChannel do
  use Phoenix.Channel

  @impl true
  def join("room:" <> _room, _payload, socket),  do: {:ok, socket}
  def join("global",      _payload, socket),    do: {:ok, socket}

  @impl true
  # optional mirror of unsubscribe event
  def handle_in("unsubscribe", _payload, socket), do: {:stop, :normal, socket}
end
