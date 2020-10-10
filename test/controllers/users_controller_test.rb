require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get portifolio" do
    get users_portifolio_url
    assert_response :success
  end

end
