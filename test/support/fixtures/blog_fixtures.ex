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
end
