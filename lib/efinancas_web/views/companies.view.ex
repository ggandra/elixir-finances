defmodule EfinancasWeb.CompaniesView do

  alias Efinancas.Company

  def render("create.json", %{company: %Company{id: id, name: name, branch: branch, country: country, city: city}}) do
    %{
      message: "Company created",
      company: %{
        id: id,
        name: name,
        branch: branch,
        country: country,
        city: city
      }
    }
  end
end
