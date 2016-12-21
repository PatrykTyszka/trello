defmodule Trello.BoardController do
  use Trello.Web, :controller

  alias Trello.{Board, Repo}

  def index(conn, _params) do
    current_user = conn.assigns.current_user
    boards = Repo.all(from b in Board, where: b.owner_id == ^current_user.id)
    conn
    |> put_status(200)
    |> render(:index, boards: boards)
  end
end
