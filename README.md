# UserPointsApi

This is a basic Elixir Genserver which updates a Users table every 60 seconds with random points and a basic API which fetches two users with points above a random generated number from localhost:4000. 1000 users are seeded with he command below. 

To boot up the genserver you will need to:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Seed the Users table with `mix run priv/repo/seeds.exs`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

