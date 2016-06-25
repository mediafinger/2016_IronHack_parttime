# all files in the config/initializers directory
# are executed when the Rails app is started

if Rails.env.development? || Rails.env.test?
  Rails.application.routes.default_url_options[:host] = "localhost:3000"
else
  Rails.application.routes.default_url_options[:host] = "www.supergreat.com"
end
