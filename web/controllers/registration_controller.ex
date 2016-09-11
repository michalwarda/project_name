defmodule ProjectName.RegistrationController do
  use ProjectName.Web, :controller
  alias ProjectName.User

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render(conn, %{changeset: changeset})
  end

  def create(conn, %{"user" => user_params}) do
    changeset = User.changeset(%User{}, user_params)

    case ProjectName.Registration.create(changeset) do
      {:ok, user} ->
        conn
        |> put_session(:current_user, user.id)
        |> put_flash(:info, "Your account was created!")
        |> redirect(to: "/rooms")
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
