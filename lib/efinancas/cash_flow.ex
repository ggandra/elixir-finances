defmodule Efinancas.CashFlow do
  use Ecto.Schema
  import Ecto.Changeset

  alias Efinancas.Company

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required_params [:type, :value, :date, :paid_received]

  schema "cash_flow" do
    field :type, :string
    field :value, :decimal
    field :date, :date
    field :paid_received, :boolean
    belongs_to :company, Company

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end
end
