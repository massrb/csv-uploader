
require_relative '../validators/phone_validator'

class UserDatum < ApplicationRecord
  validate :names_validation
	belongs_to :csv_upload
	validates_with PhoneValidator
	VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

	validates :email, format: { with: VALID_EMAIL_REGEX }

  def names_validation
    last_f = last.to_s.strip
    first_f = first.to_s.strip
    unless last_f.empty?
      if first_f.empty?
        errors.add(:names, "First name required if last name specified")
      end
      check_field(:last, last_f)
    end
    check_field(:first, first_f) unless first_f.empty?
  end

  private

  def check_field(typ, fld)
    if fld.length < 2
      errors.add(typ, "a name field must be at least 2 characters")
    elsif fld !~ /^[A-Za-z]{2,}/
      errors.add(typ, "a name field must be alpha")  
    end
  end

end
