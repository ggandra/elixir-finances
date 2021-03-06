defmodule EfinancasWeb.CompaniesController do
  use EfinancasWeb, :controller

  alias Efinancas.Company

  action_fallback EfinancasWeb.FallbackController

  def create(conn, params) do
    with {:ok, %Company{} = company} <- Efinancas.create_company(params) do
      conn
      |> put_status(:created)
      |> render("create.json", company: company)
    end
  end
end
