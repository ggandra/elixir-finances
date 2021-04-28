defmodule Efinancas.CashFlows.Update do

  alias Efinancas.{CashFlow, Repo, User}

  def call(params, current_user) do
    params
    |> build_params(current_user)
    |> CashFlow.changeset()
    |> Repo.update()
    |> handle_update()
  end

  defp handle_update({:ok, %CashFlow{}} = result), do: result
  defp handle_update({:error, reason}), do: {:error, reason}

  defp build_params(params, %User{company_id: company_id}) do
    %{
      "type" => params["type"],
      "value" => params["value"],
      "date" => params["date"],
      "paid_received" => params["paid_received"],
      "id" => params["id"],
      "company_id" => company_id
    }
  end
end
