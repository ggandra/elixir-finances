defmodule Efinancas.CashFlows.Update do

  import Ecto.Query
  alias Efinancas.{CashFlow, Repo, User}

  def call(params, %User{company_id: company_id}) do
    query = from cashflow in CashFlow,
      where: cashflow.id == ^params["id"] and cashflow.company_id == ^company_id

    Repo.update_all(query, set: [
      type: params["type"],
      value: params["value"],
      date: params["date"],
      paid_received: params["paid_received"],
    ])
    |> handle_update()
  end

  defp handle_update({1, nil}), do: {:ok, "Cash flow updated!"}
  defp handle_update({0, nil}), do: {:error, "Error on cash flow update"}
end
