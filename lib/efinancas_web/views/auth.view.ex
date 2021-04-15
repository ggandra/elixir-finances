defmodule EfinancasWeb.AuthView do

  alias Efinancas.User

  def render("auth.json", %{user: %User{name: name}, token: token}) do
    %{
      response: "User Authenticated",
      name: name,
      token: token
    }
  end
end
