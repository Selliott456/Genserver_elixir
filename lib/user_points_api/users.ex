defmodule UserPointsApi.Users do
  import Ecto.Query, warn: false
  alias UserPointsApi.Repo

  alias UserPointsApi.Users.User

  def get_users(min_number) do
    User
    |> where([u], u.points > ^min_number)
    |> limit(2)
    |> Repo.all()
  end

  def update_all_user_points() do
    Repo.transaction(fn ->
      User
      |> Repo.stream()
      |> Stream.each(fn user -> update_user(user) end)
      |> Stream.chunk_every(500)
      |> Stream.run()
    end)
  end

  def update_user(user) do
    user
    |> Ecto.Changeset.cast(%{"points" => Enum.random(0..100)}, [:points])
    |> Repo.update!()
  end
end
