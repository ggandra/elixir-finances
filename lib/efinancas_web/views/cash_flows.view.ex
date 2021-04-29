defmodule EfinancasWeb.CashFlowsView do
  use EfinancasWeb, :view

  def render("create.json", %{cashflow: cashflow}), do: %{ message: "Payment/Receipt created", cashflow: cashflow }

  def render("show.json", %{cashflow: cashflow}), do: %{ cashflow: cashflow }

  def render("update.json", %{cashflow: cashflow}), do: %{ cashflow: cashflow }

  def render("delete.json", %{cashflow: cashflow}), do: %{ cashflow: cashflow }
end
