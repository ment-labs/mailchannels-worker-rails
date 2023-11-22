# frozen_string_literal: true

require_relative "lib/mailchannels_worker/version"

Gem::Specification.new do |spec|
  spec.name = "mailchannels-worker-rails"
  spec.version = MailchannelsWorker::VERSION
  spec.authors = ["Bruno Prieto"]
  spec.email = ["brunoprietog@hey.com"]

  spec.summary = "An Action Mailer adapter for Mailchannels Cloudflare Worker."
  spec.homepage = "https://github.com/ment-labs/mailchannels-worker-rails"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.files = Dir["lib/**/*", "LICENSE.txt", "README.md"]
  spec.require_paths = ["lib"]

  spec.add_dependency "railties", ">= 6.1"

  spec.metadata["rubygems_mfa_required"] = "true"
end
