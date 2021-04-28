defmodule Efinancas.CashFlows.GetByMonth do

  import Ecto.Query
  alias Efinancas.{CashFlow, User, Repo}

  def call(%User{company_id: company_id}) do
    today = Date.utc_today()
    first_day_of_month = Date.beginning_of_month(today)
    last_day_of_month = Date.end_of_month(today)

    query = from cash_flow in CashFlow,
      where: cash_flow.date >= ^first_day_of_month and
      cash_flow.date <= ^last_day_of_month and
      cash_flow.company_id == ^company_id,
      order_by: cash_flow.inserted_at

    query
    |> Repo.all()
    |> handle_get()
  end

  defp handle_get([_head | _tail] = current_month), do: {:ok, current_month}
  defp handle_get([]), do: {:error, "You don't have any payment/receipt to this month"}
end