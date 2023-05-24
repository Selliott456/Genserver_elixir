defmodule UserPointsApiWeb.Router do
  use UserPointsApiWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", UserPointsApiWeb do
    pipe_through(:api)
    get("/", UserController, :index)
  end
end
