defmodule MyAppWeb.ContentControllerTest do
  use MyAppWeb.ConnCase

  import MyApp.BlogFixtures

  @create_attrs %{body: "some body", title: "some title", views: 42}
  @update_attrs %{body: "some updated body", title: "some updated title", views: 43}
  @invalid_attrs %{body: nil, title: nil, views: nil}

  describe "index" do
    test "lists all contents", %{conn: conn} do
      conn = get(conn, ~p"/contents")
      assert html_response(conn, 200) =~ "Listing Contents"
    end
  end

  describe "new content" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/contents/new")
      assert html_response(conn, 200) =~ "New Content"
    end
  end

  describe "create content" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/contents", content: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/contents/#{id}"

      conn = get(conn, ~p"/contents/#{id}")
      assert html_response(conn, 200) =~ "Content #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/contents", content: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Content"
    end
  end

  describe "edit content" do
    setup [:create_content]

    test "renders form for editing chosen content", %{conn: conn, content: content} do
      conn = get(conn, ~p"/contents/#{content}/edit")
      assert html_response(conn, 200) =~ "Edit Content"
    end
  end

  describe "update content" do
    setup [:create_content]

    test "redirects when data is valid", %{conn: conn, content: content} do
      conn = put(conn, ~p"/contents/#{content}", content: @update_attrs)
      assert redirected_to(conn) == ~p"/contents/#{content}"

      conn = get(conn, ~p"/contents/#{content}")
      assert html_response(conn, 200) =~ "some updated body"
    end

    test "renders errors when data is invalid", %{conn: conn, content: content} do
      conn = put(conn, ~p"/contents/#{content}", content: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Content"
    end
  end

  describe "delete content" do
    setup [:create_content]

    test "deletes chosen content", %{conn: conn, content: content} do
      conn = delete(conn, ~p"/contents/#{content}")
      assert redirected_to(conn) == ~p"/contents"

      assert_error_sent 404, fn ->
        get(conn, ~p"/contents/#{content}")
      end
    end
  end

  defp create_content(_) do
    content = content_fixture()
    %{content: content}
  end
end
