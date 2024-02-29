defmodule MyApp.SimpleApis do
  @moduledoc """
  The SimpleApis context.
  """

  import Ecto.Query, warn: false
  alias MyApp.Repo

  alias MyApp.SimpleApis.SimpleApi

  @doc """
  Returns the list of simple_apis.

  ## Examples

      iex> list_simple_apis()
      [%SimpleApi{}, ...]

  """
  def list_simple_apis do
    Repo.all(SimpleApi)
  end

  @doc """
  Gets a single simple_api.

  Raises `Ecto.NoResultsError` if the Simple api does not exist.

  ## Examples

      iex> get_simple_api!(123)
      %SimpleApi{}

      iex> get_simple_api!(456)
      ** (Ecto.NoResultsError)

  """
  def get_simple_api!(id), do: Repo.get!(SimpleApi, id)

  @doc """
  Creates a simple_api.

  ## Examples

      iex> create_simple_api(%{field: value})
      {:ok, %SimpleApi{}}

      iex> create_simple_api(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_simple_api(attrs \\ %{}) do
    %SimpleApi{}
    |> SimpleApi.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a simple_api.

  ## Examples

      iex> update_simple_api(simple_api, %{field: new_value})
      {:ok, %SimpleApi{}}

      iex> update_simple_api(simple_api, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_simple_api(%SimpleApi{} = simple_api, attrs) do
    simple_api
    |> SimpleApi.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a simple_api.

  ## Examples

      iex> delete_simple_api(simple_api)
      {:ok, %SimpleApi{}}

      iex> delete_simple_api(simple_api)
      {:error, %Ecto.Changeset{}}

  """
  def delete_simple_api(%SimpleApi{} = simple_api) do
    Repo.delete(simple_api)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking simple_api changes.

  ## Examples

      iex> change_simple_api(simple_api)
      %Ecto.Changeset{data: %SimpleApi{}}

  """
  def change_simple_api(%SimpleApi{} = simple_api, attrs \\ %{}) do
    SimpleApi.changeset(simple_api, attrs)
  end
end
