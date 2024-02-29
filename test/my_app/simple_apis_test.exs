defmodule MyApp.SimpleApisTest do
  use MyApp.DataCase

  alias MyApp.SimpleApis

  describe "simple_apis" do
    alias MyApp.SimpleApis.SimpleApi

    import MyApp.SimpleApisFixtures

    @invalid_attrs %{title: nil, url: nil}

    test "list_simple_apis/0 returns all simple_apis" do
      simple_api = simple_api_fixture()
      assert SimpleApis.list_simple_apis() == [simple_api]
    end

    test "get_simple_api!/1 returns the simple_api with given id" do
      simple_api = simple_api_fixture()
      assert SimpleApis.get_simple_api!(simple_api.id) == simple_api
    end

    test "create_simple_api/1 with valid data creates a simple_api" do
      valid_attrs = %{title: "some title", url: "some url"}

      assert {:ok, %SimpleApi{} = simple_api} = SimpleApis.create_simple_api(valid_attrs)
      assert simple_api.title == "some title"
      assert simple_api.url == "some url"
    end

    test "create_simple_api/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = SimpleApis.create_simple_api(@invalid_attrs)
    end

    test "update_simple_api/2 with valid data updates the simple_api" do
      simple_api = simple_api_fixture()
      update_attrs = %{title: "some updated title", url: "some updated url"}

      assert {:ok, %SimpleApi{} = simple_api} = SimpleApis.update_simple_api(simple_api, update_attrs)
      assert simple_api.title == "some updated title"
      assert simple_api.url == "some updated url"
    end

    test "update_simple_api/2 with invalid data returns error changeset" do
      simple_api = simple_api_fixture()
      assert {:error, %Ecto.Changeset{}} = SimpleApis.update_simple_api(simple_api, @invalid_attrs)
      assert simple_api == SimpleApis.get_simple_api!(simple_api.id)
    end

    test "delete_simple_api/1 deletes the simple_api" do
      simple_api = simple_api_fixture()
      assert {:ok, %SimpleApi{}} = SimpleApis.delete_simple_api(simple_api)
      assert_raise Ecto.NoResultsError, fn -> SimpleApis.get_simple_api!(simple_api.id) end
    end

    test "change_simple_api/1 returns a simple_api changeset" do
      simple_api = simple_api_fixture()
      assert %Ecto.Changeset{} = SimpleApis.change_simple_api(simple_api)
    end
  end
end
