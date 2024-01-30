defmodule MyAppWeb.ContentHTML do
  use MyAppWeb, :html

  embed_templates "content_html/*"

  @doc """
  Renders a content form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def content_form(assigns)

  def list_category_opts(chageset) do
    for cat <- MyApp.Blog.list_categories,
      do: [key: cat.title, value: cat.id]
  end
end
