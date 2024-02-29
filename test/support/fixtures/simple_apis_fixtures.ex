defmodule MyApp.SimpleApisFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `MyApp.SimpleApis` context.
  """

  @doc """
  Generate a simple_api.
  """
  def simple_api_fixture(attrs \\ %{}) do
    {:ok, simple_api} =
      attrs
      |> Enum.into(%{
        title: "some title",
        url: "some url"
      })
      |> MyApp.SimpleApis.create_simple_api()

    simple_api
  end
end
