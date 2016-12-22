defmodule Trello.BoardController do
  use Trello.Web, :controller

  import Trello.Auth, only: [current_user: 1]

  alias Trello.{Board, Repo}

  def index(conn, _params) do
    boards = Repo.all(from b in Board, where: b.owner_id == ^current_user(conn).id)
    conn
    |> put_status(200)
    |> render("index.html", boards: boards)
  end

  def show(conn, %{"id" => id}) do
    board = Repo.get!(Board, id)
    conn
    |> put_status(200)
    |> render("show.html", board: board)
  end
end
