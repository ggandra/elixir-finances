defmodule EfinancasWeb.FallbackController do
  use EfinancasWeb, :controller

  def call(conn, {:error, result}) do
    conn
    |> put_status(:bad_request)
    |> put_view(EfinancasWeb.ErrorView)
    |> render("400.json", result: result)
  end
end
