defmodule HealthzTest do
  use ExUnit.Case, async: true
  use Plug.Test

  test "GET healthz returns ok" do
    conn = Router.call(conn(:get, "/healthz"), [])

    assert conn.status == 200
    assert conn.resp_body == "ok"
  end
end
