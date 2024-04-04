defmodule Megin.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages, primary_key: false) do
      add(:id, :uuid, primary_key: true)

      add(:content, :string)

      add(:user_id, references(:users, column: :id, type: :binary_id))
      add(:chat_id, references(:chats, column: :id, type: :binary_id))

      timestamps()
    end
  end
end
