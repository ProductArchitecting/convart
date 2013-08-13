# Configure Spree Preferences
#
# Note: Initializing preferences available within the Admin will overwrite any changes that were made through the user interface when you restart.
#       If you would like users to be able to update a setting with the Admin it should NOT be set here.
#
# In order to initialize a setting do:
# config.setting_name = 'new value'
Spree.config do |config|
  config.site_name = "A Creative Art Gallery"
  config.site_url = "www.convart.com"
  config.logo = "logo.png"
  config.admin_interface_logo = "logo.png"
  config.allow_ssl_in_production = false

  if Rails.env=="production"
    aws = AppConfig[:aws_s3]
    config.use_s3 = aws[:use_s3]
    config.s3_bucket = aws[:s3_bucket]
    config.s3_access_key = aws[:s3_access_key]
    config.s3_secret = aws[:s3_secret]
    config.attachment_url = aws[:attachment_url]
    config.s3_host_alias = aws[:s3_host_alias]
  end

end
#ENV["USER"]=="deployer" &&  ENV["LOGNAME"]=="deployer"

if Rails.env=="production"
  Paperclip.interpolates(:s3_eu_url) do |attachment, style|
    "#{attachment.s3_protocol}://#{Spree::Config[:s3_host_alias]}/#{attachment.bucket_name}/#{attachment.path(style).gsub(%r{^/}, "" )}"
  end
end

Spree.user_class = "Spree::User"

