require "test_helper"

class InsuranceMailerTest < ActionMailer::TestCase
  test "insurance_purchased" do
    mail = InsuranceMailer.insurance_purchased
    assert_equal "Insurance purchased", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
