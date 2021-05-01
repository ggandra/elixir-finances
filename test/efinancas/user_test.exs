defmodule Efinancas.UserTest do
  use Efinancas.DataCase, async: :true

  alias Ecto.Changeset
  alias Efinancas.User

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = %{
        name: "Gabriel G",
        email: "gandra.gabriel@hotmail.com",
        password: "971998",
        company_id: "uuid"
      }

      response = User.changeset(params)

      assert %Changeset{
        changes: %{
          company_id: "uuid",
          email: "gandra.gabriel@hotmail.com",
          name: "Gabriel G",
          password_hash: _id
        }, valid?: true
      } = response
    end

    test "when there are invalid params, returns an error" do
      params = %{
        name: "",
        email: "",
        password: "",
        company_id: ""
      }
      expected_response =  %{company_id: ["can't be blank"], email: ["can't be blank"], name: ["can't be blank"], password: ["can't be blank"]}

      response = User.changeset(params)

      assert expected_response == errors_on(response)
    end
  end
end
