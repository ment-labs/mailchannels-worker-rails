# frozen_string_literal: true

require "test_helper"

class TestMailchannelsWorker < ActiveSupport::TestCase
  test "it has a version number" do
    refute_nil ::MailchannelsWorker::VERSION
  end

  test "it does something useful" do
    assert true
  end
end
