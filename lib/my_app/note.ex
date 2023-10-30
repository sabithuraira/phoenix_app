defmodule MyApp.Note do
  use Ecto.Schema
  import Ecto.Changeset

  schema "notes" do
    field :desc, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(note, attrs) do
    note
    |> cast(attrs, [:title, :desc])
    |> validate_required([:title, :desc])
  end
end
