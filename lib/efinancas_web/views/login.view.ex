defmodule EfinancasWeb.LoginView do

  alias Efinancas.User

  def render("create.json", %{user: %User{id: id, name: name, email: email}}) do
    %{
      message: "User authenticated",
      user: %{
        id: id,
        name: name,
        email: email
      }
    }
  end

end
