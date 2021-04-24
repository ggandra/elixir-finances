defmodule Efinancas.CashFlows.Create do

  alias Efinancas.{Repo, CashFlow}

  def call(params) do
    params
    |> CashFlow.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %CashFlow{}} = result), do: result
  defp handle_insert({:error, reason}), do: {:error, %{reason: reason}}
end
