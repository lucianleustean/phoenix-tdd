defmodule TddAppWeb.AppNavigationTest do
  use TddApp.IntegrationCase

  test "Basic page flow", %{conn: conn} do
    # get the root index page
    get( conn, page_path(conn, :index) )
    # click/follow through the various about pages
    |> follow_link( "Toys" )
    |> follow_link( "Home" )
    |> assert_response( status: 200, path: page_path(conn, :index) )
  end
end
