# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "bundler/setup"
require "mailchannels_worker"
require "active_support/test_case"
require "active_support/testing/autorun"
require "minitest/autorun"
