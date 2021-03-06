require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "account_activation mail has the appropriate fields" do
    user = create(:user)
    # user.activation_token = User.new_token
    mail = UserMailer.account_activation(user)
    assert_equal "Account activation", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["Jwan622@gmail.com"], mail.from
    assert_match user.first_name,               mail.body.encoded
    assert_match user.activation_token,   mail.body.encoded
    assert_match CGI::escape(user.email), mail.body.encoded
  end
end
