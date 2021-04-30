defmodule Efinancas.CompanyTest do
  use Efinancas.DataCase, async: :true

  alias Ecto.Changeset
  alias Efinancas.Company

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = %{"name" => "Efinances", "branch" => "Finances", "country" => "Brazil", "city" => "São Paulo"}

      response = Company.changeset(params)

      assert %Changeset{changes: %{branch: "Finances", city: "São Paulo", country: "Brazil", name: "Efinances"}, valid?: true} = response
    end

    test "when are invalid params, returns an error" do
      params = %{"name" => "", "branch" => "", "country" => "", "city" => ""}
      expected_response = %{branch: ["can't be blank"], city: ["can't be blank"], country: ["can't be blank"], name: ["can't be blank"]}

      response = Company.changeset(params)

      assert errors_on(response) == expected_response
    end
  end
end
