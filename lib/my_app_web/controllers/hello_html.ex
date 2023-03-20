defmodule MyAppWeb.HelloHTML do
  use MyAppWeb, :html

  # def index(assigns) do
  #   ~H"""
  #     Hello!
  #   """
  # end
  embed_templates "hello_html/*"

  attr :my_name, :string, default: "Jhon"
  def my_component(assigns) do
      ~H"""
        <h2>Hello! This is My Component and My Name is <%= @my_name %></h2>
      """
  end
end
