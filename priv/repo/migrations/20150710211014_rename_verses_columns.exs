defmodule Heartversesapi.Repo.Migrations.RenameVersesColumns do
  use Ecto.Migration

  def change do
    alter table(:verses) do
      add :translation, :string
      add :verse, :integer
      remove :number
    end
  end
end
