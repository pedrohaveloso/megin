defmodule Megin.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages, primary_key: false) do
      add(:uuid, :uuid, primary_key: true)

      add(:content, :string)
      add(:sender, :string)
      add(:target, :string)

      timestamps()
    end
  end
end
