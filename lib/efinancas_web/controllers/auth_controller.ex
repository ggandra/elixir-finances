defmodule EfinancasWeb.AuthController do
  use EfinancasWeb, :controller

  alias Efinancas.Guardian

  action_fallback EfinancasWeb.FallbackController

  def login(conn, params) do
    with {:ok, user} <- Efinancas.auth_login(params) do
      {:ok, token, _full_claims} = Guardian.encode_and_sign(user, %{}, ttl: {15, :minute})
      conn
      |> put_status(:ok)
      |> render("auth.json", user: user, token: token)
    end
  end
end
