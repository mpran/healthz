defmodule Router do
  @moduledoc "Test implementation of a router"

  use Plug.Router

  plug(:match)
  plug(:dispatch)

  forward("/healthz", to: Healthz)
end
