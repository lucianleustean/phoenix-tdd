defmodule TddAppWeb.ToyController do
  use TddAppWeb, :controller

  alias TddApp.Playground
  alias TddApp.Playground.Toy

  def index(conn, _params) do
    toys = Playground.list_toys()
    render(conn, "index.html", toys: toys)
  end

  def new(conn, _params) do
    changeset = Playground.change_toy(%Toy{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"toy" => toy_params}) do
    case Playground.create_toy(toy_params) do
      {:ok, toy} ->
        conn
        |> put_flash(:info, "Toy created successfully.")
        |> redirect(to: toy_path(conn, :show, toy))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    toy = Playground.get_toy!(id)
    render(conn, "show.html", toy: toy)
  end

  def edit(conn, %{"id" => id}) do
    toy = Playground.get_toy!(id)
    changeset = Playground.change_toy(toy)
    render(conn, "edit.html", toy: toy, changeset: changeset)
  end

  def update(conn, %{"id" => id, "toy" => toy_params}) do
    toy = Playground.get_toy!(id)

    case Playground.update_toy(toy, toy_params) do
      {:ok, toy} ->
        conn
        |> put_flash(:info, "Toy updated successfully.")
        |> redirect(to: toy_path(conn, :show, toy))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", toy: toy, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    toy = Playground.get_toy!(id)
    {:ok, _toy} = Playground.delete_toy(toy)

    conn
    |> put_flash(:info, "Toy deleted successfully.")
    |> redirect(to: toy_path(conn, :index))
  end
end
