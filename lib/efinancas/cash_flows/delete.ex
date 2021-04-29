defmodule Efinancas.CashFlows.Delete do

  import Ecto.Query
  alias Efinancas.{CashFlow, Repo, User}

  def call(params, %User{company_id: company_id}) do
    query = from cashflow in CashFlow,
      where: cashflow.id == ^params["id"] and cashflow.company_id == ^company_id

    Repo.delete_all(query)
    |> handle_delete()
  end

  defp handle_delete({1, nil}), do: {:ok, "Cash flow deleted!"}
  defp handle_delete({0, nil}), do: {:error, "Error on cash flow delete"}
end
