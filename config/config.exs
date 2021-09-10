# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :ragna_moba,
  ecto_repos: [RagnaMoba.Repo]

# Configures the endpoint
config :ragna_moba, RagnaMobaWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "hV54wDxTPE6j0l9wq70eQJfMiTUp95iEzL7riAYAZp9C0bvs/sKQ9N15wZpRKqH6",
  render_errors: [view: RagnaMobaWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: RagnaMoba.PubSub,
  live_view: [signing_salt: "cht93jOc"]

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.12.18",
  default: [
    args: ~w(js/app.js --bundle --target=es2016 --outdir=../priv/static/assets),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
