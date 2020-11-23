class UserDatum < ApplicationRecord
	belongs_to :csv_upload
	validates_with PhoneValidator

	validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

end
