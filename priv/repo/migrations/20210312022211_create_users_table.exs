defmodule Efinancas.Repo.Migrations.CreateUsersTable do
  use Ecto.Migration

  def change do
    create table :users do
      add :name, :string
      add :email, :string
      add :password_hash, :string
      add :company_id, references(:companies, type: :binary_id)

      timestamps()
    end

    create unique_index(:users, [:email])
  end
end
