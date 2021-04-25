defmodule Efinancas.Auth.ErrorHandler do
  @behaviour Guardian.Plug.ErrorHandler

  @impl Guardian.Plug.ErrorHandler
  def auth_error(conn, {type, reason}, opts) do
    IO.inspect(conn)

  end
end
