defmodule Efinancas.Repo do
  use Ecto.Repo,
    otp_app: :efinancas,
    adapter: Ecto.Adapters.Postgres
end
