defmodule Megin.Communications.Participant do
  alias Megin.Accounts
  alias Megin.Communications

  use Ecto.Schema

  import Ecto.Changeset

  @primary_key {:uuid, :binary_id, autogenerate: true}

  schema "participants" do
    belongs_to(:chat, Communications.Chat, references: :uuid)
    belongs_to(:user, Accounts.User, references: :uuid)

    timestamps()
  end

  @doc false
  def changeset(participant, attrs \\ %{}) do
    participant
    |> cast(attrs, [:chat, :user])
    |> validate_required([:chat, :user])
  end
end
