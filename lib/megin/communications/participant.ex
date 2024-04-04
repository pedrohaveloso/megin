defmodule Megin.Communications.Participant do
  use Ecto.Schema

  import Ecto.Changeset

  alias Megin.Accounts
  alias Megin.Communications

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "participants" do
    belongs_to(:chat, Communications.Chat, type: :binary_id)
    belongs_to(:user, Accounts.User, type: :binary_id)

    timestamps()
  end

  @doc false
  def changeset(participant, attrs \\ %{}) do
    participant
    |> cast(attrs, [:chat, :user])
    |> validate_required([:chat, :user])
  end
end
