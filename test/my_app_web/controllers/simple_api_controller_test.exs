defmodule MyAppWeb.SimpleApiControllerTest do
  use MyAppWeb.ConnCase

  import MyApp.SimpleApisFixtures

  alias MyApp.SimpleApis.SimpleApi

  @create_attrs %{
    title: "some title",
    url: "some url"
  }
  @update_attrs %{
    title: "some updated title",
    url: "some updated url"
  }
  @invalid_attrs %{title: nil, url: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all simple_apis", %{conn: conn} do
      conn = get(conn, ~p"/api/simple_apis")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create simple_api" do
    test "renders simple_api when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/simple_apis", simple_api: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/simple_apis/#{id}")

      assert %{
               "id" => ^id,
               "title" => "some title",
               "url" => "some url"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/simple_apis", simple_api: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update simple_api" do
    setup [:create_simple_api]

    test "renders simple_api when data is valid", %{conn: conn, simple_api: %SimpleApi{id: id} = simple_api} do
      conn = put(conn, ~p"/api/simple_apis/#{simple_api}", simple_api: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/simple_apis/#{id}")

      assert %{
               "id" => ^id,
               "title" => "some updated title",
               "url" => "some updated url"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, simple_api: simple_api} do
      conn = put(conn, ~p"/api/simple_apis/#{simple_api}", simple_api: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete simple_api" do
    setup [:create_simple_api]

    test "deletes chosen simple_api", %{conn: conn, simple_api: simple_api} do
      conn = delete(conn, ~p"/api/simple_apis/#{simple_api}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/simple_apis/#{simple_api}")
      end
    end
  end

  defp create_simple_api(_) do
    simple_api = simple_api_fixture()
    %{simple_api: simple_api}
  end
end
