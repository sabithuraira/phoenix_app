defmodule MyApp.Blog.Category do
  use Ecto.Schema
  import Ecto.Changeset

  alias MyApp.Blog.Content

  schema "categories" do
    field :title, :string

    has_many :contents, Content

    timestamps()
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, [:title])
    |> validate_required([:title])
    |> unique_constraint(:title)
  end
end
