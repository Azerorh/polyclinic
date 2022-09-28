Cloudinary.config do |config|
  config.cloud_name = Rails.application.credentials[:cloudinary_cloud]
  config.api_key = Rails.application.credentials[:cloudinary_key]
  config.api_secret = Rails.application.credentials[:cloudinary_secret]
  config.secure = true
end