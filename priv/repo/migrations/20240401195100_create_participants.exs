defmodule Megin.Repo.Migrations.CreateParticipants do
  use Ecto.Migration

  def change do
    create table(:participants, primary_key: false) do
      add(:uuid, :uuid, primary_key: true)

      add(:user, references(:users, column: :uuid, type: :binary_id))
      add(:chat, references(:chats, column: :uuid, type: :binary_id))

      timestamps()
    end
  end
end
