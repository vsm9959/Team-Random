OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['293525044330387'], ENV['8c579140956e9061193b8fac6f9af9d4']
end