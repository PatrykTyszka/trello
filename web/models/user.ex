defmodule Trello.User do
  use Trello.Web, :model

  schema "users" do
    field :username, :string
    field :password, :string, virtual: true
    field :password_hash, :string

    timestamps
  end
end
