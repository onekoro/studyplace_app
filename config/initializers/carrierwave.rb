require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'
# Rails.env.development? ||
unless Rails.env.test?
  CarrierWave.configure do |config|
    config.cache_storage = :fog
    config.fog_provider = 'fog/aws'
    config.fog_directory  = 'study-support'
    config.fog_public = false
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      region: ENV['AWS_DEFAULT_REGION']
    }
  end
end
  
#   CarrierWave.configure do |config|
#   if Rails.env.production? || Rails.env.development? # 開発中もs3使う
#     config.storage :fog
#     config.fog_provider = 'fog/aws'
#     config.fog_directory  = 'study-support'
#     config.asset_host = 'https://s3.amazonaws.com/study-support'
#     # NOTE: AWS側の設定を変えなくても、この１行の設定でアップロードできた
#     config.fog_public = false # ←コレ
#     config.fog_credentials = {
#       provider: 'AWS',
#       aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
#       aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
#       region: ENV['AWS_DEFAULT_REGION'],
#     }
#   else
#     config.storage :file
#     config.enable_processing = false if Rails.env.test?
#   end
# end
