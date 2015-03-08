require 'test_helper'

class PromptsControllerTest < ActionController::TestCase
  test "should get base" do
    get :prompt
    assert_response :success
    assert_select "tr#writingprompts"
  end

end
