defmodule Megin.Repo do
  use Ecto.Repo,
    otp_app: :megin,
    adapter: Ecto.Adapters.Postgres
end
