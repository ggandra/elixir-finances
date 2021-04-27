defmodule Efinancas do
  alias Efinancas.Auth.Login, as: AuthLogin
  alias Efinancas.Companies.Create, as: CreateCompany
  alias Efinancas.CashFlows.Create, as: CreateCashFlow
  alias Efinancas.CashFlows.GetByMonth, as: GetCashFlowByMonth

  defdelegate auth_login(params), to: AuthLogin, as: :call
  defdelegate create_company(params), to: CreateCompany, as: :call
  defdelegate create_cash_flow(params, current_user), to: CreateCashFlow, as: :call
  defdelegate get_cash_flow_by_month(current_user), to: GetCashFlowByMonth, as: :call
end
