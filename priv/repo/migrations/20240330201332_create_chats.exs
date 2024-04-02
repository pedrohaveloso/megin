defmodule Megin.Repo.Migrations.CreateChats do
  use Ecto.Migration

  def change do
    create table(:chats, primary_key: false) do
      add(:uuid, :uuid, primary_key: true)

      timestamps()
    end
  end
end
