defmodule Efinancas do
  alias Efinancas.Company.Create, as: CreateCompany
  alias Efinancas.Auth.Login, as: AuthLogin

  defdelegate create_company(params), to: CreateCompany, as: :call
  defdelegate auth_login(params), to: AuthLogin, as: :call
end
