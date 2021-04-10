defmodule EfinancasWeb.PageController do
  use EfinancasWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
