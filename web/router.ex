defmodule Trello.Router do
  use Trello.Web, :router

  import Trello.Auth, only: [authenticate_user: 2]

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Trello.Auth, repo: Trello.Repo
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Trello do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/session/new", SessionController, :new, as: :new_session
    post "/sign_in", SessionController, :create
    delete "/sign_out", SessionController, :destroy, as: :destroy_session
  end

  scope "/boards", Trello do
    pipe_through [:browser, :authenticate_user]

    get "/", BoardController, :index, as: :index_boards
  end
end
