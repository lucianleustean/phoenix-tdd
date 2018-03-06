defmodule TddApp.Repo.Migrations.CreateToys do
  use Ecto.Migration

  def change do
    create table(:toys) do
      add :name, :string
      add :type, :string

      timestamps()
    end

  end
end
