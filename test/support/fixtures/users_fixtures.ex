defmodule UserPointsApi.UsersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `UserPointsApi.Users` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        points: 42
      })
      |> UserPointsApi.Users.create_user()

    user
  end
end
