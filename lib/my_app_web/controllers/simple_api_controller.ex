defmodule MyAppWeb.SimpleApiController do
  use MyAppWeb, :controller

  alias MyApp.SimpleApis
  alias MyApp.SimpleApis.SimpleApi

  action_fallback MyAppWeb.FallbackController

  def index(conn, _params) do
    simple_apis = SimpleApis.list_simple_apis()
    render(conn, :index, simple_apis: simple_apis)
  end

  def create(conn, %{"simple_api" => simple_api_params}) do
    with {:ok, %SimpleApi{} = simple_api} <- SimpleApis.create_simple_api(simple_api_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/simple_apis/#{simple_api}")
      |> render(:show, simple_api: simple_api)
    end
  end

  def show(conn, %{"id" => id}) do
    simple_api = SimpleApis.get_simple_api!(id)
    render(conn, :show, simple_api: simple_api)
  end

  def update(conn, %{"id" => id, "simple_api" => simple_api_params}) do
    simple_api = SimpleApis.get_simple_api!(id)

    with {:ok, %SimpleApi{} = simple_api} <- SimpleApis.update_simple_api(simple_api, simple_api_params) do
      render(conn, :show, simple_api: simple_api)
    end
  end

  def delete(conn, %{"id" => id}) do
    simple_api = SimpleApis.get_simple_api!(id)

    with {:ok, %SimpleApi{}} <- SimpleApis.delete_simple_api(simple_api) do
      send_resp(conn, :no_content, "")
    end
  end
end
