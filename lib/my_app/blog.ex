defmodule MyApp.Blog do
  @moduledoc """
  The Blog context.
  """

  import Ecto.Query, warn: false
  alias MyApp.Repo

  alias MyApp.Blog.Content

  @doc """
  Returns the list of contents.

  ## Examples

      iex> list_contents()
      [%Content{}, ...]

  """
  def list_contents do
    Repo.all(Content)
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
  def get_content!(id), do: Repo.get!(Content, id)

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
    |> Content.changeset(attrs)
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
    |> Content.changeset(attrs)
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
    Content.changeset(content, attrs)
  end
end
