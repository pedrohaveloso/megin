defmodule Megin.Communications.Message do
  alias Megin.Communications

  use Ecto.Schema

  import Ecto.Changeset

  @primary_key {:uuid, :binary_id, autogenerate: true}

  schema "messages" do
    field(:content, :string)
    field(:sender, :string)

    belongs_to(:chat, Communications.Chat, references: :uuid)

    timestamps()
  end

  @doc false
  def changeset(message, attrs \\ %{}) do
    message
    |> cast(attrs, [:content, :sender, :chat])
    |> validate_required([:content, :sender, :chat])
  end
end
