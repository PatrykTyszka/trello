defmodule Trello.Column do
  use Trello.Web, :model

  schema "columns" do
    field :title, :string
    field :position, :integer

    belongs_to :board, Trello.Board, foreign_key: :board_id

    timestamps
  end

  def changeset(model, params \\ :empty) do
    model |> cast(params, ~w(title board_id), [])
  end
end
