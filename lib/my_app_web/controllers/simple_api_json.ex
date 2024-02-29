defmodule MyAppWeb.SimpleApiJSON do
  alias MyApp.SimpleApis.SimpleApi

  @doc """
  Renders a list of simple_apis.
  """
  def index(%{simple_apis: simple_apis}) do
    %{data: for(simple_api <- simple_apis, do: data(simple_api))}
  end

  @doc """
  Renders a single simple_api.
  """
  def show(%{simple_api: simple_api}) do
    %{data: data(simple_api)}
  end

  defp data(%SimpleApi{} = simple_api) do
    %{
      id: simple_api.id,
      url: simple_api.url,
      title: simple_api.title
    }
  end
end
