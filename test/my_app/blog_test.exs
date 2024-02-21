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

  describe "categories" do
    alias MyApp.Blog.Category

    import MyApp.BlogFixtures

    @invalid_attrs %{title: nil}

    test "list_categories/0 returns all categories" do
      category = category_fixture()
      assert Blog.list_categories() == [category]
    end

    test "get_category!/1 returns the category with given id" do
      category = category_fixture()
      assert Blog.get_category!(category.id) == category
    end

    test "create_category/1 with valid data creates a category" do
      valid_attrs = %{title: "some title"}

      assert {:ok, %Category{} = category} = Blog.create_category(valid_attrs)
      assert category.title == "some title"
    end

    test "create_category/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Blog.create_category(@invalid_attrs)
    end

    test "update_category/2 with valid data updates the category" do
      category = category_fixture()
      update_attrs = %{title: "some updated title"}

      assert {:ok, %Category{} = category} = Blog.update_category(category, update_attrs)
      assert category.title == "some updated title"
    end

    test "update_category/2 with invalid data returns error changeset" do
      category = category_fixture()
      assert {:error, %Ecto.Changeset{}} = Blog.update_category(category, @invalid_attrs)
      assert category == Blog.get_category!(category.id)
    end

    test "delete_category/1 deletes the category" do
      category = category_fixture()
      assert {:ok, %Category{}} = Blog.delete_category(category)
      assert_raise Ecto.NoResultsError, fn -> Blog.get_category!(category.id) end
    end

    test "change_category/1 returns a category changeset" do
      category = category_fixture()
      assert %Ecto.Changeset{} = Blog.change_category(category)
    end
  end

  describe "tags" do
    alias MyApp.Blog.Tag

    import MyApp.BlogFixtures

    @invalid_attrs %{title: nil}

    test "list_tags/0 returns all tags" do
      tag = tag_fixture()
      assert Blog.list_tags() == [tag]
    end

    test "get_tag!/1 returns the tag with given id" do
      tag = tag_fixture()
      assert Blog.get_tag!(tag.id) == tag
    end

    test "create_tag/1 with valid data creates a tag" do
      valid_attrs = %{title: "some title"}

      assert {:ok, %Tag{} = tag} = Blog.create_tag(valid_attrs)
      assert tag.title == "some title"
    end

    test "create_tag/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Blog.create_tag(@invalid_attrs)
    end

    test "update_tag/2 with valid data updates the tag" do
      tag = tag_fixture()
      update_attrs = %{title: "some updated title"}

      assert {:ok, %Tag{} = tag} = Blog.update_tag(tag, update_attrs)
      assert tag.title == "some updated title"
    end

    test "update_tag/2 with invalid data returns error changeset" do
      tag = tag_fixture()
      assert {:error, %Ecto.Changeset{}} = Blog.update_tag(tag, @invalid_attrs)
      assert tag == Blog.get_tag!(tag.id)
    end

    test "delete_tag/1 deletes the tag" do
      tag = tag_fixture()
      assert {:ok, %Tag{}} = Blog.delete_tag(tag)
      assert_raise Ecto.NoResultsError, fn -> Blog.get_tag!(tag.id) end
    end

    test "change_tag/1 returns a tag changeset" do
      tag = tag_fixture()
      assert %Ecto.Changeset{} = Blog.change_tag(tag)
    end
  end
end
