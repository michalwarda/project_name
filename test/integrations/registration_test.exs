defmodule ProjectName.RegistrationTest do
  use ProjectName.IntegrationCase

  @tag :integration
  test "register new user" do
    navigate_to "/registrations/new"
    sign_up_form = find_element(:css, "form")

    sign_up_form
    |> find_within_element(:id, "user_email")
    |> fill_field("mihau@gmail.com")

    sign_up_form
    |> find_within_element(:id, "user_password")
    |> fill_field("password")

    sign_up_form
    |> submit_element

    assert page_source =~ "Your account was created!"
  end
end
