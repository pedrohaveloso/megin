defmodule Megin.Repo.Migrations.CreateParticipants do
  use Ecto.Migration

  def change do
    create table(:participants, primary_key: false) do
      add(:id, :uuid, primary_key: true)

      add(:user_id, references(:users, column: :id, type: :binary_id))
      add(:chat_id, references(:chats, column: :id, type: :binary_id))

      timestamps()
    end
  end
end
