defmodule EventDispatcherWeb.Plugs.ApiKeyAuth do
  import Plug.Conn



  def init(opts), do: opts
  def call(conn, _opts) do
    api_key = System.get_env("API_KEY") || ""
    case get_req_header(conn, "key") do
      [key] when key == api_key -> conn
      _ ->
        conn
        |> put_status(:unauthorized)
        |> json(%{error: "Unauthorized"})
        |> halt()
    end
  end

  defp json(conn, body) do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(conn.status || 200, Jason.encode!(body))
  end
end
