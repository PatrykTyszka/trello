defmodule Trello.BoardChannel do
  use Phoenix.Channel

  alias Trello.{Board, Repo, Column}
  def join("board:management", _message, socket) do
    {:ok, socket}
  end
  def join("board:" <> _private_room_id, _params, _socket) do
    {:error, %{reason: "unauthorized"}}
  end

  def handle_in("board:add_column", %{"id" => id, "title" => title}, socket) do
    changeset = Column.changeset(%Column{}, %{title: title, board_id: id})
    case Repo.insert(changeset) do
      {:ok, column} ->
        IO.puts "OK"
        payload = %{title: column.title, id: column.id}
        broadcast! socket, "board:add_column", payload
        {:reply, {:ok, %{body: payload}}, socket}
      {:error, changeset} ->
        IO.puts "ERROR"
        {:reply, %{errors: changeset.errors, message: "Could not create column!"}, socket}
    end
  end
end
