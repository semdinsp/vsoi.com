defmodule Vsoi.Repo do
  use Ecto.Repo,
    otp_app: :vsoi,
    adapter: Ecto.Adapters.Postgres
end
