class UserDatum < ApplicationRecord
	validates_with PhoneValidator

	validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

end
