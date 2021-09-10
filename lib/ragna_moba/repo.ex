defmodule RagnaMoba.Repo do
  use Ecto.Repo,
    otp_app: :ragna_moba,
    adapter: Ecto.Adapters.SQLite3
end
