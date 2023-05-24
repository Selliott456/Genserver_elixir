defmodule UserPointsApiWeb.UserController do
  use UserPointsApiWeb, :controller

  action_fallback(UserPointsApiWeb.FallbackController)

  def index(conn, _params) do
    {timestamp, user_list} = GenServer.call(UserList, :get_users_and_timestamp, 60000)
    render(conn, "index.json", timestamp: timestamp, users: user_list)
  end
end
