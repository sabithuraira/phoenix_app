defmodule MyApp.Repo.Migrations.CreateContents do
  use Ecto.Migration

  def change do
    create table(:contents) do
      add :title, :string
      add :body, :text
      add :views, :integer

      timestamps()
    end
  end
end
