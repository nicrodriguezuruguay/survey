require 'test_helper'

class RecoverPasswordTest < ActionMailer::TestCase
  test "recover_password_notification" do
    mail = RecoverPassword.recover_password_notification
    assert_equal "Recover password notification", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
