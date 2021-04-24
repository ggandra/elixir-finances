defmodule Efinancas do
  alias Efinancas.Auth.Login, as: AuthLogin
  alias Efinancas.Companies.Create, as: CreateCompany
  alias Efinancas.CashFlows.Create, as: CreateCashFlow

  defdelegate auth_login(params), to: AuthLogin, as: :call
  defdelegate create_company(params), to: CreateCompany, as: :call
  defdelegate create_cash_flow(params), to: CreateCashFlow, as: :call
end
