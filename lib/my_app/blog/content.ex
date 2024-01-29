defmodule MyApp.Blog.Content do
  use Ecto.Schema
  import Ecto.Changeset

  schema "contents" do
    field :body, :string
    field :title, :string
    field :views, :integer

    timestamps()
  end

  @doc false
  def changeset(content, attrs) do
    content
    |> cast(attrs, [:title, :body, :views])
    |> validate_required([:title, :body])
  end
end
