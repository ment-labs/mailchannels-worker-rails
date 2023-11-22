# frozen_string_literal: true

module MailchannelsWorker
  class Railtie < Rails::Railtie
    initializer "mailchannels_worker.add_delivery_method", before: "action_mailer.set_configs" do
      ActiveSupport.on_load :action_mailer do
        ActionMailer::Base.add_delivery_method :mailchannels_worker, MailchannelsWorker::DeliveryMethod
      end
    end
  end
end
