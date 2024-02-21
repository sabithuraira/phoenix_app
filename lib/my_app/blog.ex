defmodule MyApp.Blog do
  @moduledoc """
  The Blog context.
  """

  import Ecto.Query, warn: false
  alias MyApp.Repo

  alias MyApp.Blog.Content
  alias MyApp.Blog.Tag

  @doc """
  Returns the list of contents.

  ## Examples

      iex> list_contents()
      [%Content{}, ...]

  """
  def list_contents do
    Repo.all(Content)
      |> Repo.preload(:category)
  end

  @doc """
  Gets a single content.

  Raises `Ecto.NoResultsError` if the Content does not exist.

  ## Examples

      iex> get_content!(123)
      %Content{}

      iex> get_content!(456)
      ** (Ecto.NoResultsError)

  """
  def get_content!(id) do
    Repo.get!(Content, id)
      |> Repo.preload(:category)
      |> Repo.preload(:tags)
  end

  def auto_add_views(%Content{views: curr_views}=page) do
    page
      |> Content.changeset(%{views: curr_views + 1})
      |> Repo.update()
  end

  @doc """
  Creates a content.

  ## Examples

      iex> create_content(%{field: value})
      {:ok, %Content{}}

      iex> create_content(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_content(attrs \\ %{}) do
    %Content{}
    # |> Content.changeset(attrs)
    |> change_content(attrs)
    |> Ecto.Changeset.put_change(:views, 0)
    |> Repo.insert()
  end

  @doc """
  Updates a content.

  ## Examples

      iex> update_content(content, %{field: new_value})
      {:ok, %Content{}}

      iex> update_content(content, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_content(%Content{} = content, attrs) do
    content
    # |> Content.changeset(attrs)
    |> change_content(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a content.

  ## Examples

      iex> delete_content(content)
      {:ok, %Content{}}

      iex> delete_content(content)
      {:error, %Ecto.Changeset{}}

  """
  def delete_content(%Content{} = content) do
    Repo.delete(content)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking content changes.

  ## Examples

      iex> change_content(content)
      %Ecto.Changeset{data: %Content{}}

  """
  def change_content(%Content{} = content, attrs \\ %{}) do
    # Content.changeset(content, attrs)
    tags = list_tags_by_id(attrs["tag_ids"])
    content
      |> Repo.preload(:tags)
      |> Content.changeset(attrs)
      |> Ecto.Changeset.put_assoc(:tags, tags)
  end

  def list_tags_by_id(nil), do: []

  def list_tags_by_id(tag_ids) do
    Repo.all(from t in Tag, where: t.id in ^tag_ids)
  end


  alias MyApp.Blog.Category

  @doc """
  Returns the list of categories.

  ## Examples

      iex> list_categories()
      [%Category{}, ...]

  """
  def list_categories do
    Repo.all(Category)
  end

  @doc """
  Gets a single category.

  Raises `Ecto.NoResultsError` if the Category does not exist.

  ## Examples

      iex> get_category!(123)
      %Category{}

      iex> get_category!(456)
      ** (Ecto.NoResultsError)

  """
  def get_category!(id), do: Repo.get!(Category, id)

  @doc """
  Creates a category.

  ## Examples

      iex> create_category(%{field: value})
      {:ok, %Category{}}

      iex> create_category(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_category(attrs \\ %{}) do
    %Category{}
    |> Category.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a category.

  ## Examples

      iex> update_category(category, %{field: new_value})
      {:ok, %Category{}}

      iex> update_category(category, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_category(%Category{} = category, attrs) do
    category
    |> Category.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a category.

  ## Examples

      iex> delete_category(category)
      {:ok, %Category{}}

      iex> delete_category(category)
      {:error, %Ecto.Changeset{}}

  """
  def delete_category(%Category{} = category) do
    Repo.delete(category)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking category changes.

  ## Examples

      iex> change_category(category)
      %Ecto.Changeset{data: %Category{}}

  """
  def change_category(%Category{} = category, attrs \\ %{}) do
    Category.changeset(category, attrs)
  end


  @doc """
  Returns the list of tags.

  ## Examples

      iex> list_tags()
      [%Tag{}, ...]

  """
  def list_tags do
    Repo.all(Tag)
  end

  @doc """
  Gets a single tag.

  Raises `Ecto.NoResultsError` if the Tag does not exist.

  ## Examples

      iex> get_tag!(123)
      %Tag{}

      iex> get_tag!(456)
      ** (Ecto.NoResultsError)

  """
  def get_tag!(id), do: Repo.get!(Tag, id)

  @doc """
  Creates a tag.

  ## Examples

      iex> create_tag(%{field: value})
      {:ok, %Tag{}}

      iex> create_tag(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_tag(attrs \\ %{}) do
    %Tag{}
    |> Tag.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a tag.

  ## Examples

      iex> update_tag(tag, %{field: new_value})
      {:ok, %Tag{}}

      iex> update_tag(tag, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_tag(%Tag{} = tag, attrs) do
    tag
    |> Tag.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a tag.

  ## Examples

      iex> delete_tag(tag)
      {:ok, %Tag{}}

      iex> delete_tag(tag)
      {:error, %Ecto.Changeset{}}

  """
  def delete_tag(%Tag{} = tag) do
    Repo.delete(tag)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking tag changes.

  ## Examples

      iex> change_tag(tag)
      %Ecto.Changeset{data: %Tag{}}

  """
  def change_tag(%Tag{} = tag, attrs \\ %{}) do
    Tag.changeset(tag, attrs)
  end
end
