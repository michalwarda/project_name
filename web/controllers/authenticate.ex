defmodule ProjectName.Plugs.Authenticate do
  import Plug.Conn
  import ProjectName.Router.Helpers
  import Phoenix.Controller, only: [put_flash: 3, redirect: 2]
  import ProjectName.Session, only: [current_user: 1]

  def init(default), do: default

  def call(conn, default) do
    case current_user(conn) do
      nil ->
        conn
        |> put_flash(:error, "You need to be signed in to view this page.")
        |> redirect(to: session_path(conn, :new))
      _ -> conn
    end
  end
end
