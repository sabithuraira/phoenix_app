defmodule MyAppWeb.NewFallbackController do
  use Phoenix.Controller

  def call(conn, nil) do
    conn
      |> put_flash(:error, "Data Not Found")
      |> put_view(html: MyAppWeb.ErrorHTML, json: MyAppWeb.ErrorJSON)
      |> render(:"404")
  end
end
