defmodule MyApp.Repo.Migrations.CreateSampleTable do
  use Ecto.Migration

  def change do
    create table(:sample) do
      add :title, :string
      add :description, :string
      timestamps()
    end
  end
end

