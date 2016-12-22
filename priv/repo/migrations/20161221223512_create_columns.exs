defmodule Trello.Repo.Migrations.CreateColumns do
  use Ecto.Migration

  def change do
    create table(:columns) do
      add :title, :string
      add :position, :integer
      add :board_id, references(:boards)

      timestamps
    end
  end
end
