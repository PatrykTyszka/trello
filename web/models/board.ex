defmodule Trello.Board do
  use Trello.Web, :model

  schema "boards" do
    field :name, :string
    belongs_to :owner, Trello.User, foreign_key: :owner_id

    timestamps
  end

  def changeset(model, params \\ :empty) do
    model |> cast(params, ~w(name owner_id), [])
  end
end
