defmodule Trello.Repo.Migrations.CreateBoards do
  use Ecto.Migration

  def change do
    create table(:boards) do
      add :name, :string
      add :owner_id, references(:users)

      timestamps
    end
  end
end
