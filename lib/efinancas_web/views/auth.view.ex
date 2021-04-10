defmodule EfinancasWeb.AuthView do

  def render("auth.json", _response) do
    %{
      ok: "User Authenticated"
    }
  end
end
