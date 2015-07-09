defmodule Heartversesapi.Repo.Migrations.CreateKJV do
  use Ecto.Migration

  def change do
    create table(:verses) do
      add :book, :string
      add :chapter, :integer
      add :number, :integer
      add :text, :string

      timestamps
    end
  end
end
