defmodule Efinancas.Auth.Login do

  alias Efinancas.{User, Repo}

  def call(params) do
    Repo.get_by(User, email: params["email"])
    |> match_password(params)
  end

  defp match_password(%User{password_hash: password_hash} = user, params) do
    Bcrypt.verify_pass(params["password"], password_hash)
    |> handle_auth(user)
  end

  defp handle_auth(true, user), do: {:ok, user}
  defp handle_auth(false, _user), do: {:error, "Password not match"}
end
