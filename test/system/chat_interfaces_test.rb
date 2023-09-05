require "application_system_test_case"

class ChatInterfacesTest < ApplicationSystemTestCase
  setup do
    @chat_interface = chat_interfaces(:one)
  end

  test "visiting the index" do
    visit chat_interfaces_url
    assert_selector "h1", text: "Chat interfaces"
  end

  test "should create chat interface" do
    visit chat_interfaces_url
    click_on "New chat interface"

    fill_in "User", with: @chat_interface.user_id
    click_on "Create Chat interface"

    assert_text "Chat interface was successfully created"
    click_on "Back"
  end

  test "should update Chat interface" do
    visit chat_interface_url(@chat_interface)
    click_on "Edit this chat interface", match: :first

    fill_in "User", with: @chat_interface.user_id
    click_on "Update Chat interface"

    assert_text "Chat interface was successfully updated"
    click_on "Back"
  end

  test "should destroy Chat interface" do
    visit chat_interface_url(@chat_interface)
    click_on "Destroy this chat interface", match: :first

    assert_text "Chat interface was successfully destroyed"
  end
end
