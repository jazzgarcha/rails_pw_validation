require "application_system_test_case"

class RegistrationsTest < ApplicationSystemTestCase
  test "sign up works" do
    visit sign_up_url

    fill_in "Email", with: "hey@hey.com"
    fill_in "password", with: "Password#1"
    click_on "Sign up"

    assert_text "Welcome! You have signed up successfully"
  end

  test "password needs a symbol" do
    visit sign_up_url

    fill_in "Email", with: "hey@hey.com"
    fill_in "password", with: "Password1"
    click_on "Sign up"

    assert_text "Must include at least one Symbol"
  end

  test "password needs a Uppercase" do
    visit sign_up_url

    fill_in "Email", with: "hey@hey.com"
    fill_in "password", with: "password#1"
    click_on "Sign up"

    assert_text "Must include at least one Uppercase letter"
  end

  test "password needs a downcase" do
    visit sign_up_url

    fill_in "Email", with: "hey@hey.com"
    fill_in "password", with: "PASSWORD#1"
    click_on "Sign up"

    assert_text "Must include at least one Lowercase letter"
  end

  test "password needs a digit" do
    visit sign_up_url

    fill_in "Email", with: "hey@hey.com"
    fill_in "password", with: "Password#"
    click_on "Sign up"

    assert_text "Must include at least one Digit"
  end

  test "password needs a be at least 8 digits" do
    visit sign_up_url

    fill_in "Email", with: "hey@hey.com"
    fill_in "password", with: "Passd#1"
    click_on "Sign up"

    assert_text "is too short (minimum is 8 characters)"
  end
end
