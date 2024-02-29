defmodule MyApp.SimpleApis.SimpleApi do
  use Ecto.Schema
  import Ecto.Changeset

  schema "simple_apis" do
    field :title, :string
    field :url, :string

    timestamps()
  end

  @doc false
  def changeset(simple_api, attrs) do
    simple_api
    |> cast(attrs, [:url, :title])
    |> validate_required([:url, :title])
  end
end
