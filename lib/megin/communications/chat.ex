defmodule Megin.Communications.Chat do
  use Ecto.Schema

  @primary_key {:uuid, :binary_id, autogenerate: true}

  schema "chats" do
    timestamps()
  end
end
