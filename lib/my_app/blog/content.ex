defmodule MyApp.Blog.Content do
  use Ecto.Schema
  import Ecto.Changeset

  alias MyApp.Blog.Category
  alias MyApp.Blog.Tag

  schema "contents" do
    field :body, :string
    field :title, :string
    field :views, :integer

    belongs_to :category, Category
    many_to_many :tags, Tag, join_through: "content_tags", on_replace: :delete

    timestamps()
  end

  @doc false
  def changeset(content, attrs) do
    content
    |> cast(attrs, [:title, :body, :views, :category_id])
    |> validate_required([:title, :body])
  end
end
