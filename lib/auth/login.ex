defmodule Efinancas.Auth.Login do

  alias Efinancas.{User, Repo}

  def call(params) do
    Repo.get_by(User, email: params["email"])
    |> match_password(params)
  end

  defp match_password(%User{password_hash: password_hash}, params) do
    Bcrypt.verify_pass(params["password"], password_hash)
    |> handle_auth()
  end

  defp handle_auth(true), do: {:ok, "User Authenticated"}
  defp handle_auth(false), do: {:error, "Password not match"}
end
