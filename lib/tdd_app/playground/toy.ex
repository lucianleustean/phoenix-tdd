defmodule TddApp.Playground.Toy do
  use Ecto.Schema
  import Ecto.Changeset


  schema "toys" do
    field :name, :string
    field :type, :string

    timestamps()
  end

  @doc false
  def changeset(toy, attrs) do
    toy
    |> cast(attrs, [:name, :type])
    |> validate_required([:name, :type])
  end
end
