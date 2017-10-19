require 'yaml'
require 'twitter'

yaml_data = YAML::load(ERB.new(IO.read(File.join(Rails.root, 'config', 'application.yml'))).result)
APP_CONFIG = HashWithIndifferentAccess.new(yaml_data)

CLIENT = Twitter::REST::Client.new do |config| 
  config.consumer_key        = APP_CONFIG[:consumer_key]
  config.consumer_secret     = APP_CONFIG[:consumer_secret]
  config.access_token        = APP_CONFIG[:access_token]
  config.access_token_secret = APP_CONFIG[:access_token_secret]
end


 
