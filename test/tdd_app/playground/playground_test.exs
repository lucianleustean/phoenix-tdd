defmodule TddApp.PlaygroundTest do
  use TddApp.DataCase

  alias TddApp.Playground

  describe "toys" do
    alias TddApp.Playground.Toy

    @valid_attrs %{name: "some name", type: "some type"}
    @update_attrs %{name: "some updated name", type: "some updated type"}
    @invalid_attrs %{name: nil, type: nil}

    def toy_fixture(attrs \\ %{}) do
      {:ok, toy} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Playground.create_toy()

      toy
    end

    test "list_toys/0 returns all toys" do
      toy = toy_fixture()
      assert Playground.list_toys() == [toy]
    end

    test "get_toy!/1 returns the toy with given id" do
      toy = toy_fixture()
      assert Playground.get_toy!(toy.id) == toy
    end

    test "create_toy/1 with valid data creates a toy" do
      assert {:ok, %Toy{} = toy} = Playground.create_toy(@valid_attrs)
      assert toy.name == "some name"
      assert toy.type == "some type"
    end

    test "create_toy/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Playground.create_toy(@invalid_attrs)
    end

    test "update_toy/2 with valid data updates the toy" do
      toy = toy_fixture()
      assert {:ok, toy} = Playground.update_toy(toy, @update_attrs)
      assert %Toy{} = toy
      assert toy.name == "some updated name"
      assert toy.type == "some updated type"
    end

    test "update_toy/2 with invalid data returns error changeset" do
      toy = toy_fixture()
      assert {:error, %Ecto.Changeset{}} = Playground.update_toy(toy, @invalid_attrs)
      assert toy == Playground.get_toy!(toy.id)
    end

    test "delete_toy/1 deletes the toy" do
      toy = toy_fixture()
      assert {:ok, %Toy{}} = Playground.delete_toy(toy)
      assert_raise Ecto.NoResultsError, fn -> Playground.get_toy!(toy.id) end
    end

    test "change_toy/1 returns a toy changeset" do
      toy = toy_fixture()
      assert %Ecto.Changeset{} = Playground.change_toy(toy)
    end
  end
end
