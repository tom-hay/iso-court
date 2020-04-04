require 'test_helper'

class SentencesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get sentences_new_url
    assert_response :success
  end

  test "should get create" do
    get sentences_create_url
    assert_response :success
  end

  test "should get delete" do
    get sentences_delete_url
    assert_response :success
  end

end
