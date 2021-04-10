defmodule EfinancasWeb.LoginView do

  alias Efinancas.User

  def render("create.json", %{user: %User{id: id, name: name, email: email, role: role}}) do
    %{
      message: "User authenticated",
      user: %{
        id: id,
        name: name,
        email: email,
        role: role
      }
    }
  end

end
