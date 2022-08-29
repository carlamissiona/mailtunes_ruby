require "application_system_test_case"

class RadiosTest < ApplicationSystemTestCase
  setup do
    @radio = radios(:one)
  end

  test "visiting the index" do
    visit radios_url
    assert_selector "h1", text: "Radios"
  end

  test "should create radio" do
    visit radios_url
    click_on "New radio"

    fill_in "Link url", with: @radio.link_url
    fill_in "Name", with: @radio.name
    click_on "Create Radio"

    assert_text "Radio was successfully created"
    click_on "Back"
  end

  test "should update Radio" do
    visit radio_url(@radio)
    click_on "Edit this radio", match: :first

    fill_in "Link url", with: @radio.link_url
    fill_in "Name", with: @radio.name
    click_on "Update Radio"

    assert_text "Radio was successfully updated"
    click_on "Back"
  end

  test "should destroy Radio" do
    visit radio_url(@radio)
    click_on "Destroy this radio", match: :first

    assert_text "Radio was successfully destroyed"
  end
end
