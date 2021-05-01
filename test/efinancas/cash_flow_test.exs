defmodule Efinancas.CashFlowTest do
  use Efinancas.DataCase, async: :true

  alias Ecto.Changeset
  alias Efinancas.CashFlow

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = %{
        type: "add",
        value: "105.74",
        date: "2021-05-07",
        paid_received: true,
        company_id: "uuid",
      }

      response = CashFlow.changeset(params)

      assert %Changeset{
        changes: %{
          company_id: "uuid",
          date: ~D[2021-05-07],
          paid_received: true,
          type: "add",
          value: _value
        },valid?: true
      } = response
    end

    test "when there are invalid params, returns an error" do
      params = %{
        type: "",
        value: "",
        date: "",
        paid_received: "",
        company_id: "",
      }
      expected_response = %{company_id: ["can't be blank"], date: ["can't be blank"], paid_received: ["can't be blank"], type: ["can't be blank"], value: ["can't be blank"]}

      response = CashFlow.changeset(params)

      assert expected_response == errors_on(response)
    end
  end
end
