defmodule Trello.BoardView do
  use Trello.Web, :view

  alias Trello.Repo

  def owner(board) do
    Repo.preload(board, :owner).owner
  end

  def columns(board) do
    Repo.preload(board, :columns).columns
  end
end
