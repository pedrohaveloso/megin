defmodule Megin.Accounts.Session do
  alias Megin.Accounts

  use Ecto.Schema

  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:ip, :active?, :user]}

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "session" do
    field(:ip, :string)
    field(:active?, :boolean)

    belongs_to(:user, Accounts.User, type: :binary_id)

    timestamps()
  end

  @doc false
  def changeset(session, attrs \\ %{}) do
    session
    |> cast(attrs, [:ip, :active?, :user])
    |> validate_required([:ip, :active?, :user])
  end
end
