# Load the Rails application.
require File.expand_path('../application', __FILE__)

DevStudyMission08::Application.configure do
  config.assets.append_path 'bower_components'
end

# Initialize the Rails application.
DevStudyMission08::Application.initialize!
