defmodule MyApp.BlogTest do
  use MyApp.DataCase

  alias MyApp.Blog

  describe "contents" do
    alias MyApp.Blog.Content

    import MyApp.BlogFixtures

    @invalid_attrs %{body: nil, title: nil, views: nil}

    test "list_contents/0 returns all contents" do
      content = content_fixture()
      assert Blog.list_contents() == [content]
    end

    test "get_content!/1 returns the content with given id" do
      content = content_fixture()
      assert Blog.get_content!(content.id) == content
    end

    test "create_content/1 with valid data creates a content" do
      valid_attrs = %{body: "some body", title: "some title", views: 42}

      assert {:ok, %Content{} = content} = Blog.create_content(valid_attrs)
      assert content.body == "some body"
      assert content.title == "some title"
      assert content.views == 42
    end

    test "create_content/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Blog.create_content(@invalid_attrs)
    end

    test "update_content/2 with valid data updates the content" do
      content = content_fixture()
      update_attrs = %{body: "some updated body", title: "some updated title", views: 43}

      assert {:ok, %Content{} = content} = Blog.update_content(content, update_attrs)
      assert content.body == "some updated body"
      assert content.title == "some updated title"
      assert content.views == 43
    end

    test "update_content/2 with invalid data returns error changeset" do
      content = content_fixture()
      assert {:error, %Ecto.Changeset{}} = Blog.update_content(content, @invalid_attrs)
      assert content == Blog.get_content!(content.id)
    end

    test "delete_content/1 deletes the content" do
      content = content_fixture()
      assert {:ok, %Content{}} = Blog.delete_content(content)
      assert_raise Ecto.NoResultsError, fn -> Blog.get_content!(content.id) end
    end

    test "change_content/1 returns a content changeset" do
      content = content_fixture()
      assert %Ecto.Changeset{} = Blog.change_content(content)
    end
  end
end