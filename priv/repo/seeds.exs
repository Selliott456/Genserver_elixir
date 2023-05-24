# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     UserPointsApi.Repo.insert!(%UserPointsApi.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias UserPointsApi.Repo
alias UserPointsApi.Users.User

# seeds Users table with 1000,000 users, points all set to zero.
1..1000
|> Enum.each(fn _ ->
  Repo.insert!(%User{
    points: 0
  })
end)
