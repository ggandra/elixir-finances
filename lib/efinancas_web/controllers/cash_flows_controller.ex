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

  def show(conn, params) do
    with :true <- Guardian.Plug.authenticated?(conn) do
      current_user = Guardian.Plug.current_resource(conn)

      with {:ok, cashflow} <- Efinancas.get_cash_flow_by_month(params, current_user) do
        conn
        |> put_status(:ok)
        |> render("show.json", cashflow: cashflow)
      end
    end
  end

  def update(conn, params) do
    with :true <- Guardian.Plug.authenticated?(conn) do
      current_user = Guardian.Plug.current_resource(conn)

      with {:ok, cashflow} <- Efinancas.update_cash_flow(params, current_user) do
        conn
        |> put_status(:ok)
        |> render("update.json", cashflow: cashflow)
      end
    end
  end

  def delete(conn, params) do
    with :true <- Guardian.Plug.authenticated?(conn) do
      current_user = Guardian.Plug.current_resource(conn)

      with {:ok, cashflow} <- Efinancas.delete_cash_flow(params, current_user) do
        conn
        |> put_status(:ok)
        |> render("delete.json", cashflow: cashflow)
      end
    end
  end
end
