defmodule Efinancas do
  alias Efinancas.Company.Create, as: CompanyCreate
  alias Efinancas.Auth.Login, as: AuthLogin

  defdelegate create_company(params), to: CompanyCreate, as: :call
  defdelegate auth_login(params), to: AuthLogin, as: :call
end
