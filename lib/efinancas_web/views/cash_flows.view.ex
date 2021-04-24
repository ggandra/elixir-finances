defmodule EfinancasWeb.CashFlowsView do
  use EfinancasWeb, :view

  def render("create.json", %{cashflow: cashflow}) do
    %{
      message: "Company created",
      cashflow: cashflow
    }
  end
end
