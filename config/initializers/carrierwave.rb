require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.storage = :fog
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: Rails.application.secrets.aws_access_key_id,
    aws_secret_access_key: Rails.application.secrets.aws_secret_access_key,
    region: 'us-east-2'
  }

  case Rails.env
  when 'production'
  config.fog_directory  = 'airbnb-practice'
  config.asset_host = 'https://s3.us-east-2.amazonaws.com/airbnb-practice'
  end
end
