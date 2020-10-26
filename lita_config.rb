Lita.configure do |config|
  # The name your robot will use.
  config.robot.name = "Lita"

  # The locale code for the language to use.
  # config.robot.locale = :en

  # The severity of messages to log. Options are:
  # :debug, :info, :warn, :error, :fatal
  # Messages at the selected level and above will be logged.
  config.robot.log_level = :info

  # An array of user IDs that are considered administrators. These users
  # the ability to add and remove other users from authorization groups.
  # What is considered a user ID will change depending on which adapter you use.
  # config.robot.admins = ["1", "2"]

  # The adapter you want to connect with. Make sure you've added the
  # appropriate gem to the Gemfile.
  # config.robot.adapter = :shell
  if ENV['RACK_ENV'] == 'production'
    config.robot.adapter = :slack
    config.redis[:url] = ENV.fetch('REDIS_URL')
    config.adapters.slack.token = "xoxb-1466083074897-1438722039591-eLSdiJmMlBGWzkHODi8THXwq"
  else
    config.robot.adapters = :shell
  end
  config.adapters.slack.token = ENV.fetch("xoxb-1466083074897-1438722039591-eLSdiJmMlBGWzkHODi8THXwq", '')
  ## Example: Set options for the chosen adapter.
  # config.adapter.username = "myname"
  # config.adapter.password = "secret"

  ## Example: Set options for the Redis connection.
  # config.redis.host = "127.0.0.1"
  # config.redis.port = 1234

  ## Example: Set configuration for any loaded handlers. See the handler's
  ## documentation for options.
  # config.handlers.some_handler.some_config_key = "value"
end
