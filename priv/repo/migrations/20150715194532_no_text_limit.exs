defmodule Heartversesapi.Repo.Migrations.NoTextLimit do
  use Ecto.Migration

  def change do
    alter table(:verses) do
      modify :text, :text
    end
  end
end
