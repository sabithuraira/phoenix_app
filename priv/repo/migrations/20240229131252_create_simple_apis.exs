defmodule MyApp.Repo.Migrations.CreateSimpleApis do
  use Ecto.Migration

  def change do
    create table(:simple_apis) do
      add :url, :string
      add :title, :string

      timestamps()
    end
  end
end
