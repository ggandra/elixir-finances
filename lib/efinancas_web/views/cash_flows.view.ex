defmodule EfinancasWeb.CashFlowsView do
  use EfinancasWeb, :view

  def render("create.json", %{cashflow: cashflow}) do
    %{
      message: "Payment/Receipt created",
      cashflow: cashflow
    }
  end

  def render("show.json", %{cashflow: cashflow}) do
    %{
      cashflow: cashflow
    }
  end
end
