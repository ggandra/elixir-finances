defmodule EfinancasWeb.AuthController do
  use EfinancasWeb, :controller

  def login(conn, params) do
    with {:ok, response} <- Efinancas.auth_login(params) do
      conn
      |> put_status(:ok)
      |> render("auth.json", response: response)
    end
  end
end
