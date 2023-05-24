defmodule UserPointsApi.Repo do
  use Ecto.Repo,
    otp_app: :user_points_api,
    adapter: Ecto.Adapters.Postgres
end
