defmodule Efinancas.CashFlows.GetByMonth do

  import Ecto.Query
  alias Efinancas.{CashFlow, User, Repo}

  def call(params, %User{company_id: company_id}) do
    year = String.to_integer(params["year"])
    month = String.to_integer(params["month"])
    with {:ok, new_date}  <- Date.new(year, month, 1) do
      first_day_of_month = Date.beginning_of_month(new_date)
      last_day_of_month = Date.end_of_month(new_date)

      query = from cash_flow in CashFlow,
        where: cash_flow.date >= ^first_day_of_month and
        cash_flow.date <= ^last_day_of_month and
        cash_flow.company_id == ^company_id,
        order_by: cash_flow.inserted_at

      query
      |> Repo.all()
      |> handle_get()
    end
  end

  defp handle_get([_head | _tail] = current_month), do: {:ok, current_month}
  defp handle_get([]), do: {:error, "You don't have any payment/receipt to this month"}
end
