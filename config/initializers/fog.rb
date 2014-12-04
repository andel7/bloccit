CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:               'AWS',
    aws_access_key_id:      ENV['AWS_ACCESS_KEY_ID'],
    aws_secret_access_key:  ENV['AWS_SECRET_ACCESS_KEY'],
  #  aws_access_key_id:      'AKIAJJOQZ7PYCICDIHPQ',
  #  aws_secret_access_key:  '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',
    region: 'us-east-1'
  }
  config.fog_directory  = ENV['AWS_BUCKET']
  #config.fog_directory  = 'andel7-bloccit-development'
  config.fog_public     = true
end
