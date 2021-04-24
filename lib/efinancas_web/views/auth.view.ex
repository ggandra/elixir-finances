defmodule EfinancasWeb.AuthView do

  alias Efinancas.User

  def render("auth.json", %{user: %User{id: id, name: name, company_id: company_id}, token: token}) do
    %{
      response: "User Authenticated",
      id: id,
      name: name,
      company_id: company_id,
      token: token
    }
  end
end
