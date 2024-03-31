defmodule Megin.Communications.Message do
  use Ecto.Schema

  import Ecto.Changeset

  @primary_key {:uuid, :binary_id, autogenerate: true}

  schema "messages" do
    field(:content, :string)
    field(:sender, :string)
    field(:target, :string)

    timestamps()
  end

  @doc false
  def changeset(message, attrs \\ %{}) do
    message
    |> cast(attrs, [:content, :sender, :target])
    |> validate_required([:content, :sender, :target])
  end
end
