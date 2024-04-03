defmodule Megin.Accounts.User do
  use Ecto.Schema

  import Ecto.Changeset

  @primary_key {:uuid, :binary_id, autogenerate: true}

  schema "users" do
    field(:name, :string)
    field(:password, :string)
    field(:email, :string)

    timestamps()
  end

  @doc false
  def changeset(user, attrs \\ %{}) do
    user
    |> cast(attrs, [:name, :password, :email])
    |> validate_format(:email, ~r/@/)
    |> validate_required([:name, :password, :email])
    |> unique_constraint(:email)
  end
end
