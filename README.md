# Mailchannels Worker Rails

This is an Action Mailer adapter that allows you to send emails using the [Mailchannels Cloudflare Worker](https://github.com/ment-labs/mailchannels-worker).

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add mailchannels-worker-rails

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install mailchannels-worker-rails

## Usage

1. Start by deploying the [Mailchannels Worker](https://github.com/ment-labs/mailchannels-worker) on [Cloudflare Workers](https://workers.cloudflare.com/). Detailed instructions for this setup can be found in the [repository](https://github.com/ment-labs/mailchannels-worker), which includes all the necessary configurations.

2. Then, add the following lines to the corresponding environment file, such as `config/environments/production.rb`:

    ```ruby
    config.action_mailer.delivery_method = :mailchannels_worker
    config.action_mailer.mailchannels_worker_settings = {
      url: "YOUR_WORKER_URL",     # The URL where the worker is deployed
      api_key: "YOUR_API_KEY"     # The API Key generated and stored in the worker environment variables
    }
    ```

    Ensure to replace `YOUR_WORKER_URL` with the actual path where the worker is deployed, and `YOUR_API_KEY` with the generated API Key stored in the worker environment variables.

    Remember to store the API Key in a secure location, such as [Rails Credentials](https://guides.rubyonrails.org/security.html#custom-credentials) or secret environment variables.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ment-labs/mailchannels-worker-rails. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/ment-labs/mailchannels-worker-rails/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the MailchannelsWorker project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/ment-labs/mailchannels-worker-rails/blob/main/CODE_OF_CONDUCT.md).
