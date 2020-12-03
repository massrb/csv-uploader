
require_relative '../validators/phone_validator'

class UserDatum < ApplicationRecord
  VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  VALID_NAME_REGEX = /\A[A-Za-z]{2,}\z/
  belongs_to :csv_upload, required: false
  
  validate :names_validation
  validates_with PhoneValidator
  validates :email, format: { with: VALID_EMAIL_REGEX }
  validates :first, length: { minimum: 2 }, allow_blank: true, allow_nil: true, format: {with: VALID_NAME_REGEX }
  validates :last, length: { minimum: 2 }, allow_blank: true, allow_nil: true, format: {with: VALID_NAME_REGEX }

  def names_validation
    if !last.to_s.strip.empty? && first.to_s.strip.empty?
      errors.add(:names, "First name required if last name specified")
    end
  end
end
