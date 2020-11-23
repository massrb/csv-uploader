
require_relative '../validators/phone_validator'

class UserDatum < ApplicationRecord
	belongs_to :csv_upload
	validates_with PhoneValidator
	VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

	validates :email, format: { with: VALID_EMAIL_REGEX }

end
