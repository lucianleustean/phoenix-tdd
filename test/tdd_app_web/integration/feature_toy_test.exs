defmodule TddAppWeb.FeatureToyTest do
  use TddApp.IntegrationCase

  test "Create new toy", %{conn: conn} do
    # create new toy
    conn = get( conn, toy_path(conn, :index) )
    |> follow_link( "New" )
    |> follow_form( %{ toy: %{
          name: "Playstation",
          type: "game"
        }} )

    # check toy page
    conn
    |> assert_response(
        status: 200,
        path: toy_path(conn, :show, conn.assigns.toy.id),
        html: "Playstation" )
  end

  test "Update toy", %{conn: conn} do
    # create new toy
    {:ok, toy} = TddApp.Playground.create_toy(%{name: "Playstation", type: "game"})

    # update toy
    conn = get( conn, toy_path(conn, :show, toy.id) )
    |> follow_link( "Edit" )
    |> follow_form( %{ toy: %{
          name: "xBox"
        }} )

    # check toy page
    conn
    |> assert_response(
        status: 200,
        path: toy_path(conn, :show, conn.assigns.toy.id),
        html: "xBox" )
  end

  test "Delete toy", %{conn: conn} do
    # create new toy
    {:ok, toy} = TddApp.Playground.create_toy(%{name: "Playstation", type: "game"})

    # delete toy
    conn = get( conn, toy_path(conn, :index) )
    |> follow_link( toy_path(conn, :delete, toy.id), method: :delete )

    # check toy page
    conn
    |> assert_response(
        status: 200,
        path: toy_path(conn, :index),
        html: "Toy deleted successfuslly." )
  end
end
