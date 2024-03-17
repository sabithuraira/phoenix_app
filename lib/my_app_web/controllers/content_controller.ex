defmodule MyAppWeb.ContentController do
  use MyAppWeb, :controller

  alias MyApp.Blog
  alias MyApp.Blog.Content

  action_fallback MyAppWeb.NewFallbackController

  def index(conn, _params) do
    contents = Blog.list_contents()
    render(conn, :index, contents: contents)
  end

  def new(conn, _params) do
    changeset = Blog.change_content(%Content{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"content" => content_params}) do
    case Blog.create_content(content_params) do
      {:ok, content} ->
        conn
        |> put_flash(:info, "Content created successfully.")
        |> redirect(to: ~p"/contents/#{content}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    # content = Blog.get_content(id)
    # content
    #   |> Blog.auto_add_views()
    # render(conn, :show, content: content)

    with %Content{} = content <- Blog.get_content(id) do
      content
        |> Blog.auto_add_views()
      render(conn, :show, content: content)
    end
  end

  def edit(conn, %{"id" => id}) do
    content = Blog.get_content(id)
    changeset = Blog.change_content(content)
    render(conn, :edit, content: content, changeset: changeset)
  end

  def update(conn, %{"id" => id, "content" => content_params}) do
    content = Blog.get_content!(id)

    case Blog.update_content(content, content_params) do
      {:ok, content} ->
        conn
        |> put_flash(:info, "Content updated successfully.")
        |> redirect(to: ~p"/contents/#{content}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, content: content, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    content = Blog.get_content!(id)
    {:ok, _content} = Blog.delete_content(content)

    conn
    |> put_flash(:info, "Content deleted successfully.")
    |> redirect(to: ~p"/contents")
  end
end
