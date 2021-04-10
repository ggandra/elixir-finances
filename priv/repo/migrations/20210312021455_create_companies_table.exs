defmodule Efinancas.Repo.Migrations.CreateCompaniesTable do
  use Ecto.Migration

  def change do
    create table :companies do
      add :name, :string
      add :branch, :string
      add :country, :string
      add :city, :string

      timestamps()
    end
  end
end
