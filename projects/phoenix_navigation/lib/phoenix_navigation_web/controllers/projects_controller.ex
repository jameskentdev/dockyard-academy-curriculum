defmodule PhoenixNavigationWeb.ProjectsController do
  use PhoenixNavigationWeb, :controller

  def home(conn, _params) do
    render(conn, :projects)
  end
end
