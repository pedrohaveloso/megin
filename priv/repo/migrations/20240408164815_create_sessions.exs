defmodule Megin.Repo.Migrations.CreateSessions do
  use Ecto.Migration

  def change do
    create table(:sessions, primary_key: false) do
      add(:id, :uuid, primary_key: true)

      add(:ip, :string)
      add(:active?, :boolean)

      add(:user_id, references(:users, column: :id, type: :binary_id))

      timestamps()
    end
  end
end
