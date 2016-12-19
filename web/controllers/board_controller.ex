defmodule Trello.BoardController do
  use Trello.Web, :controller

  def index(conn, _params) do
    conn |> render(:index)
  end
end
