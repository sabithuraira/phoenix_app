defmodule MyApp.Blog.Content do
  use Ecto.Schema
  import Ecto.Changeset

  alias MyApp.Blog.Category

  schema "contents" do
    field :body, :string
    field :title, :string
    field :views, :integer

    belongs_to :category, Category

    timestamps()
  end

  @doc false
  def changeset(content, attrs) do
    content
    |> cast(attrs, [:title, :body, :views, :category_id])
    |> validate_required([:title, :body])
  end
end
