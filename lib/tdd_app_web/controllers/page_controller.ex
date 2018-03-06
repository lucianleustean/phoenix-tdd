defmodule TddAppWeb.PageController do
  use TddAppWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
