require 'test_helper'

class UsersSingupTest < ActionDispatch::IntegrationTest

  test "invlid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name: "",
                                         email: "user@invalid",
                                         password: "foo",
                                         password_confirmation: "bar"
                                         }
                                }
   end
   follow_direct!
   assert_template 'users/show'
  end
end
