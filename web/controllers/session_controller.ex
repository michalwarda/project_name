defmodule ProjectName.SessionController do
  use ProjectName.Web, :controller

  def new(conn, _params) do
    render(conn, "new.html")
  end

  def create(conn, %{"session" => session_params}) do
    case ProjectName.Session.login(session_params) do
      {:ok, user} ->
        conn
        |> put_session(:current_user, user.id)
        |> put_flash(:info, "Successfully logged in!")
        |> redirect(to: room_path(conn, :index))
      :error ->
        conn
        |> put_flash(:info, "Wrong login or password")
        |> render("new.html")
    end
  end

  def delete(conn, _params) do
    conn
    |> delete_session(:current_user)
    |> put_flash(:info, "Logged out!")
    |> redirect(to: "/rooms")
  end
end
