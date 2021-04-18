defmodule Efinancas.Company do
  use Ecto.Schema
  import Ecto.Changeset

  alias Efinancas.User
  alias Efinancas.CashFlow

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required_params [:name, :branch, :country, :city]

  schema "companies" do
    field :name, :string
    field :branch, :string
    field :country, :string
    field :city, :string
    has_many :user, User
    has_many :cash_flow, CashFlow

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end
end
