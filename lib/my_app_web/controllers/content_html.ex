defmodule MyAppWeb.ContentHTML do
  use MyAppWeb, :html

  embed_templates "content_html/*"

  @doc """
  Renders a content form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def content_form(assigns)

  def list_category_opts(changeset) do
    for cat <- MyApp.Blog.list_categories,
      do: [key: cat.title, value: cat.id]
  end


  def list_tags_opts(changeset) do
    # for cat <- MyApp.Blog.list_categories,
    #   do: [key: cat.title, value: cat.id]
    existing_ids = changeset
        |> Ecto.Changeset.get_change(:tags, [])
        |> Enum.map(& &1.data.id)

    for tag <- MyApp.Blog.list_tags(),
      do: [key: tag.title, value: tag.id, selected: tag.id in existing_ids]
  end
end
