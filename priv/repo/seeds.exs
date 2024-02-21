# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     MyApp.Repo.insert!(%MyApp.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
# for title <- ["Sport", "Business", "Fashion", "Book"] do
#   {:ok, _} = MyApp.Blog.create_category(%{title: title})
# end

for title <- ["Tag1", "Tag2", "Tag3", "Tag4"] do
  {:ok, _} = MyApp.Blog.create_tag(%{title: title})
end
