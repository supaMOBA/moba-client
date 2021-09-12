import Config

config :ragna_moba, RagnaMobaWeb.Endpoint,
  server: true,
  cache_static_manifest: "priv/static/cache_manifest.json"

config :logger, level: :info
