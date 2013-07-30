# Load the Rails application.
require File.expand_path('../application', __FILE__)

AppConfig = HashWithIndifferentAccess.new(YAML.load(File.read(Rails.root.join("config/application.yml")))[Rails.env])


# Initialize the Rails application.
Convart::Application.initialize!

ActiveRecord::Base.include_root_in_json = true
