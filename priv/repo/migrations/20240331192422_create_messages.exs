defmodule Megin.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add(:uuid, :uuid)

      add(:content, :string)
      add(:sender, :string)
      add(:target, :string)

      timestamps()
    end
  end
end
