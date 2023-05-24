defmodule UserList do
  use GenServer

  alias UserPointsApi.Users
  alias Genserver

  def start_link(_args) do
    {:ok, _} = GenServer.start_link(__MODULE__, {nil, Enum.random(0..100)}, name: UserList)
  end

  def init(state) do
    schedule_points_update()
    {:ok, state}
  end

  def handle_info(:update_points, {timestamp, _min_number}) do
    Users.update_all_user_points()
    schedule_points_update()
    {:noreply, {timestamp, Enum.random(0..100)}}
  end

  def handle_call(:get_users_and_timestamp, _from, {timestamp, min_number}) do
    user_list = Users.get_users(min_number)
    {:reply, {timestamp, user_list}, {DateTime.utc_now(), min_number}}
  end

  def schedule_points_update() do
    Process.send_after(self(), :update_points, :timer.seconds(60))
  end
end
