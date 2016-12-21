defmodule Trello.BoardView do
  use Trello.Web, :view

  alias Trello.Repo

  def owner(board) do
    Repo.preload(board, :owner).owner
  end
end
