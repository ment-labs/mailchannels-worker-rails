# frozen_string_literal: true

require "active_support"
require "active_support/core_ext/object/blank"
require "net/http"
require "json"
require_relative "mailchannels_worker/railtie" if defined?(Rails)
require_relative "mailchannels_worker/version"

module MailchannelsWorker
  class DeliveryError < StandardError; end

  class DeliveryMethod
    RESERVED_HEADERS = %w[received dkim-signature Content-Type Content-Transfer-Encoding Message-ID To From Subject Reply-To CC BCC].freeze

    attr_reader :url, :api_key

    def initialize(settings = {})
      @url = settings[:url]
      @api_key = settings[:api_key]
    end

    def deliver!(mail)
      body = {
        from: { email: mail.from_address.address, name: mail.from_address.name }.compact,
        subject: mail.subject,
        personalizations: [{
          headers: mail.header.fields.map { |field| [field.name, field.value] unless field.name.in?(RESERVED_HEADERS) }.compact.to_h.presence,
          to: mail.to_addresses.map { |address| { email: address.address, name: address.name }.compact },
          cc: mail.cc_addresses.map { |address| { email: address.address, name: address.name }.compact }.presence,
          bcc: mail.bcc_addresses.map { |address| { email: address.address, name: address.name }.compact }.presence,
          reply_to: (mail.header["Reply-To"]&.element&.addresses || []).map { |address| { email: address.address, name: address.name }.compact }.presence
        }.compact],
        content: mail.parts.map { |part| { type: part.content_type, value: part.decoded } }
      }
      send_email(body)
    end

    private

    def send_email(email)
      uri = URI.parse(url)
      headers = {
        "Authorization" => "Bearer #{api_key}",
        "Content-Type" => "application/json"
      }
      response = Net::HTTP.post(uri, email.to_json, headers)
      raise MailchannelsWorker::DeliveryError, response.body unless response.is_a?(Net::HTTPSuccess)
    end
  end
end
