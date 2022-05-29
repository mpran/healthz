defmodule Healthz do
  @moduledoc """
  A lightweight plug to respond to some health checker pings

  Usage:

  router.ex
  ```
  forward("/path", Healthz)
  ```
  """

  @behaviour Plug

  import Plug.Conn, only: [send_resp: 3, put_resp_content_type: 3]

  # chaps-ignore-start
  @impl true
  def init(opts) do
    opts
  end

  # chaps-ignore-stop

  @impl true
  def call(conn, _opts) do
    conn
    |> put_resp_content_type("text/plain", nil)
    |> send_resp(:ok, "ok")
  end
end
