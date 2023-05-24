defmodule UserPointsApiWeb.UserView do
  use UserPointsApiWeb, :view
  alias UserPointsApiWeb.UserView

  def render("index.json", %{timestamp: timestamp, users: users}) do
    %{users: render_many(users, UserView, "user.json"), timestamp: timestamp}
  end

  def render("user.json", %{user: user}) do
    %{
      id: user.id,
      points: user.points
    }
  end
end
