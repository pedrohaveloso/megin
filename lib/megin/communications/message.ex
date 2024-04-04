defmodule Megin.Communications.Message do
  use Ecto.Schema

  import Ecto.Changeset

  alias Megin.Accounts
  alias Megin.Communications

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "messages" do
    field(:content, :string)

    belongs_to(:user, Accounts.User, type: :binary_id)
    belongs_to(:chat, Communications.Chat, type: :binary_id)

    timestamps()
  end

  @doc false
  def changeset(message, attrs \\ %{}) do
    message
    |> cast(attrs, [:content, :sender, :chat])
    |> validate_required([:content, :sender, :chat])
  end
end
