require "application_system_test_case"

class PnjsTest < ApplicationSystemTestCase
  setup do
    @pnj = pnjs(:one)
  end

  test "visiting the index" do
    visit pnjs_url
    assert_selector "h1", text: "Pnjs"
  end

  test "creating a Pnj" do
    visit pnjs_url
    click_on "New Pnj"

    fill_in "Q1", with: @pnj.q1
    fill_in "Q2", with: @pnj.q2
    fill_in "Score", with: @pnj.score
    fill_in "Studentid", with: @pnj.studentid
    click_on "Create Pnj"

    assert_text "Pnj was successfully created"
    click_on "Back"
  end

  test "updating a Pnj" do
    visit pnjs_url
    click_on "Edit", match: :first

    fill_in "Q1", with: @pnj.q1
    fill_in "Q2", with: @pnj.q2
    fill_in "Score", with: @pnj.score
    fill_in "Studentid", with: @pnj.studentid
    click_on "Update Pnj"

    assert_text "Pnj was successfully updated"
    click_on "Back"
  end

  test "destroying a Pnj" do
    visit pnjs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pnj was successfully destroyed"
  end
end
