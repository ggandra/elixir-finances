defmodule EfinancasWeb.CashFlowsController do
  use EfinancasWeb, :controller

  alias Efinancas.CashFlow

  alias EfinancasWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with :true <- Guardian.Plug.authenticated?(conn) do
      current_user = Guardian.Plug.current_resource(conn)

      with {:ok, %CashFlow{} = cashflow} <- Efinancas.create_cash_flow(params, current_user) do
        conn
        |> put_status(:created)
        |> render("create.json", cashflow: cashflow)
      end
    end
  end
end
