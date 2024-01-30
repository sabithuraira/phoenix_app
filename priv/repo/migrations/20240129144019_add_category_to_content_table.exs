defmodule MyApp.Repo.Migrations.AddCategoryToContentTable do
  use Ecto.Migration

  def change do
    alter table("contents") do
      add :category_id, references(:categories)
    end

    create index(:contents, [:category_id])
  end
end
