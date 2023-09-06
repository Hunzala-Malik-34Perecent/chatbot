# frozen_string_literal: true

require 'test_helper'

class ChatInterfacesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @chat_interface = chat_interfaces(:one)
  end

  test 'should get index' do
    get chat_interfaces_url
    assert_response :success
  end

  test 'should get new' do
    get new_chat_interface_url
    assert_response :success
  end

  test 'should create chat_interface' do
    assert_difference('ChatInterface.count') do
      post chat_interfaces_url, params: { chat_interface: { user_id: @chat_interface.user_id } }
    end

    assert_redirected_to chat_interface_url(ChatInterface.last)
  end

  test 'should show chat_interface' do
    get chat_interface_url(@chat_interface)
    assert_response :success
  end

  test 'should get edit' do
    get edit_chat_interface_url(@chat_interface)
    assert_response :success
  end

  test 'should update chat_interface' do
    patch chat_interface_url(@chat_interface), params: { chat_interface: { user_id: @chat_interface.user_id } }
    assert_redirected_to chat_interface_url(@chat_interface)
  end

  test 'should destroy chat_interface' do
    assert_difference('ChatInterface.count', -1) do
      delete chat_interface_url(@chat_interface)
    end

    assert_redirected_to chat_interfaces_url
  end
end
