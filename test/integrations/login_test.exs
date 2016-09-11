defmodule ProjectName.LoginTest do
  use ProjectName.IntegrationCase
  alias ProjectName.User
  alias ProjectName.Repo

  @tag :integration
  test "login" do
    User.changeset(%User{}, %{email: "mihau@gmail.com", password: "password"})
    |> ProjectName.Registration.create

    navigate_to "/login"

    login_form = find_element(:css, "form")

    login_form
    |> find_within_element(:id, "session_email")
    |> fill_field("mihau@gmail.com")

    login_form
    |> find_within_element(:id, "session_password")
    |> fill_field("password")

    login_form
    |> submit_element

    assert page_source =~ "Successfully logged in!"
  end
end
