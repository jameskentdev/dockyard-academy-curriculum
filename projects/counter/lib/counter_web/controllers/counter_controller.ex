defmodule CounterWeb.CounterController do
  use CounterWeb, :controller

  def count(conn, params) do
    # The template atom is used to find a template used to render the page. In this case it's an atom, so I need provide
    # a page which contains that atom; "counter_html/count.html.heex".
    # The path starts from "counter_html" because that is what is set in counter_html.ex.
    render(conn, :count, count: params["count"] || 0)
  end

  @spec increment(Plug.Conn.t(), nil | maybe_improper_list() | map()) :: Plug.Conn.t()
  def increment(conn, params) do
    IO.puts(" in increment")
    current_count = String.to_integer(params["count"])
    increment_by = String.to_integer(params["increment_by"])
    render(conn, :count, count: current_count + increment_by)
  end
end
