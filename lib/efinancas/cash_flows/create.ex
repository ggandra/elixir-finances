defmodule Efinancas.CashFlows.Create do

  alias Efinancas.{Repo, CashFlow, User}

  def call(params, current_user) do
    params
    |> build_params(current_user)
    |> CashFlow.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %CashFlow{}} = result), do: result
  defp handle_insert({:error, reason}), do: {:error, reason}

  defp build_params(params, %User{company_id: company_id}) do
    %{
      "type" => params["type"],
      "value" => params["value"],
      "date" => params["date"],
      "paid_received" => params["paid_received"],
      "company_id" => company_id
    }
  end
end
