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
    {:ok,  resource}
  end
  def resource_from_claims() do
    {:error, "Invalid Token"}
  end
end
