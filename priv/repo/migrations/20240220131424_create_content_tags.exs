defmodule MyApp.Repo.Migrations.CreateContentTags do
  use Ecto.Migration

  def change do
    create table(:content_tags, primary_key: false) do
      add :content_id, references(:contents, on_delete: :delete_all)
      add :tag_id, references(:tags, on_delete: :delete_all)
    end

    create index(:content_tags, [:content_id])
    create unique_index(:content_tags, [:content_id, :tag_id])
  end
end
