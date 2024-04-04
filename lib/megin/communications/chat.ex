defmodule Megin.Communications.Chat do
  use Ecto.Schema

  alias Megin.Communications

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "chats" do
    has_many(:participant, Communications.Participant)

    timestamps()
  end
end
