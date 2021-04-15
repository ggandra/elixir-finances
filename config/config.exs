# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :efinancas,
  ecto_repos: [Efinancas.Repo]

config :efinancas, Efinancas.Repo,
  migration_primary_key: [type: :binary_id],
  migration_foreign_key: [type: :binary_id]

config :efinancas, Efinancas.Guardian,
  issuer: "efinancas",
  secret_key: "tLd+WFILGFsih+8BuQLgyh9eBMbOghny1P4ZZihumiVwvqG42F86YsNRmHey+c60"

# Configures the endpoint
config :efinancas, EfinancasWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Xvjsg0nZib1blyWf81IHV29fiz99HWf2Xw5L3laiKtmgpFUM3ctTH1DpeD9Uha5C",
  render_errors: [view: EfinancasWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Efinancas.PubSub,
  live_view: [signing_salt: "Ja1iX/fs"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
