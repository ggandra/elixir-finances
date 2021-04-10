defmodule Efinancas.Repo.Migrations.CreateCashFlowsTable do
  use Ecto.Migration

  def change do
    create table :cash_flows do
      add :type, :string
      add :value, :decimal
      add :company_id, references(:companies, type: :binary_id)

      timestamps()
    end
  end
end
