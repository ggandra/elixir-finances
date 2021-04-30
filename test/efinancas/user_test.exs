defmodule Efinancas.UserTest do
  use Efinancas.DataCase, async: :true

  alias Ecto.Changeset
  alias Efinancas.User

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = %{
        name: "Gabriel G",
        email: "gandra.gabriel@hotmail.com",
        password: "971998"
      }

      response = User.changeset(params)

      assert "xubungo" = response
    end

    # test "when there are invalid params, returns an error" do

    # end
  end
end
