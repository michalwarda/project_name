defmodule ProjectName.PageController do
  use ProjectName.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
