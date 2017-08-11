OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "1378514698912034", "5917d7503563121ea72955b28321374b"
end


