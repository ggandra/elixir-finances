defmodule Efinancas do
  alias Efinancas.Auth.Login, as: AuthLogin
  alias Efinancas.Companies.Create, as: CreateCompany
  alias Efinancas.CashFlows.Create, as: CreateCashFlow
  alias Efinancas.CashFlows.GetByMonth, as: GetCashFlowByMonth
  alias Efinancas.CashFlows.Update, as: UpdateCashFlow
  alias Efinancas.CashFlows.Delete, as: DeleteCashFlow

  defdelegate auth_login(params), to: AuthLogin, as: :call
  defdelegate create_company(params), to: CreateCompany, as: :call
  defdelegate create_cash_flow(params, current_user), to: CreateCashFlow, as: :call
  defdelegate update_cash_flow(params, current_user), to: UpdateCashFlow, as: :call
  defdelegate delete_cash_flow(params, current_user), to: DeleteCashFlow, as: :call
  defdelegate get_cash_flow_by_month(params, current_user), to: GetCashFlowByMonth, as: :call
end
