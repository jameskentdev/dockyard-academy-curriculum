defmodule PhoenixNavigationWeb.AboutController do
  use PhoenixNavigationWeb, :controller

  def home(conn, _params) do
    render(conn, :about)
  end
end
