defmodule MyAppWeb.HelloController do
  use MyAppWeb, :controller

  def index(conn, _params) do
    conn
      |> put_flash(:info, "Welcome to Phoenix")
      |> render(:index)

    # render(conn, :index)
    # text(conn, "This is text exampel")
    # json(conn, %{id: "my id"})
    # redirect(conn, to: ~p"/hello/hai")
    # redirect(conn, external: "https://www.phoenixframework.org/")
    # send_resp(conn,201, "This is success")
  end

  def show(conn, %{"msg"=>msg}) do
    # render(conn, :show, msg: msg)
    conn
      # |> put_layout(html: :my_layout)
      |> assign(:msg, msg)
      |> render(:show)
  end
end
