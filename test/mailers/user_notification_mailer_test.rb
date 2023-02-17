require "test_helper"

class UserNotificationMailerTest < ActionMailer::TestCase
  test "signup_mail" do
    mail = UserNotificationMailer.signup_mail
    assert_equal "Signup mail", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
