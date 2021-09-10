defmodule RagnaMoba.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      RagnaMoba.Repo,
      RagnaMobaWeb.Telemetry,
      {Phoenix.PubSub, name: RagnaMoba.PubSub},
      RagnaMobaWeb.Endpoint,
      {Desktop.Window, desktop()}
    ]

    Desktop.identify_default_locale(RagnaMobaWeb.Gettext)

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: RagnaMoba.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    RagnaMobaWeb.Endpoint.config_change(changed, removed)
    :ok
  end

  defp desktop do
    [
      app: :ragna_moba,
      id: RagnaMobaApp,
      title: "ragnaMOBA",
      size: {800, 600},
      icon: "static/images/icon.png",
      # menubar: RagnaMobaApp.MenuBar,
      # icon_menu: RagnaMobaApp.Menu,
      url: &RagnaMobaWeb.Endpoint.url/0
    ]
  end
end
