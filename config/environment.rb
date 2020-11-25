# Load the Rails application.
require_relative 'application'

logger.info("******** S3 BUCKET #{ENV['S3_BUCKET']} *********")

# Initialize the Rails application.
Rails.application.initialize!
