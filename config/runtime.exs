import Config

if config_env() == :prod do
  config :ragna_moba, RagnaMobaWeb.Endpoint,
    http: [
      ip: {0, 0, 0, 0, 0, 0, 0, 0},
      port: 3542
    ]
end
