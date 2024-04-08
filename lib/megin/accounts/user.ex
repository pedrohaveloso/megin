defmodule Megin.Accounts.User do
  alias Megin.Accounts
  alias Megin.Communications

  use Ecto.Schema

  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:id, :name, :email]}

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "users" do
    field(:name, :string)
    field(:password, :string)
    field(:email, :string)

    has_many(:participant, Communications.Participant)
    has_many(:message, Communications.Message)
    has_many(:session, Accounts.User)

    timestamps()
  end

  @doc false
  def changeset(user, attrs \\ %{}) do
    changeset =
      user
      |> cast(attrs, [:name, :password, :email])
      |> validate_format(:email, ~r/@/)
      |> validate_required([:name, :password, :email])
      |> unique_constraint(:email)

    password = get_change(changeset, :password)

    changeset
    |> put_change(:password, Argon2.hash_pwd_salt(password))
  end
end
