defmodule MyApp.BlogFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `MyApp.Blog` context.
  """

  @doc """
  Generate a content.
  """
  def content_fixture(attrs \\ %{}) do
    {:ok, content} =
      attrs
      |> Enum.into(%{
        body: "some body",
        title: "some title",
        views: 42
      })
      |> MyApp.Blog.create_content()

    content
  end

  @doc """
  Generate a unique category title.
  """
  def unique_category_title, do: "some title#{System.unique_integer([:positive])}"

  @doc """
  Generate a category.
  """
  def category_fixture(attrs \\ %{}) do
    {:ok, category} =
      attrs
      |> Enum.into(%{
        title: unique_category_title()
      })
      |> MyApp.Blog.create_category()

    category
  end

  @doc """
  Generate a unique tag title.
  """
  def unique_tag_title, do: "some title#{System.unique_integer([:positive])}"

  @doc """
  Generate a tag.
  """
  def tag_fixture(attrs \\ %{}) do
    {:ok, tag} =
      attrs
      |> Enum.into(%{
        title: unique_tag_title()
      })
      |> MyApp.Blog.create_tag()

    tag
  end
end
