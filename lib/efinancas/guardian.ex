defmodule Efinancas.Guardian do
  use Guardian, otp_app: :efinancas

  alias Efinancas.{User, Repo}

  def subject_for_token(user, _claims) do
    sub = to_string(user.id)
    {:ok, sub}
  end
  def subject_for_token(reason_for_error) do
    {:error, reason_for_error}
  end

  def resource_from_claims(claims) do
    id = claims["sub"]
    resource = Repo.get_by(User, id: id)

    resource
    |> handle_resource()
  end

  defp handle_resource(%User{} = user), do: {:ok, user}
  defp handle_resource(nil), do: {:error, "Invalid Token"}
end
