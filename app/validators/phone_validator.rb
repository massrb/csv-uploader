class PhoneValidator < ActiveModel::Validator
  def validate(record)
    emsg = 'invalid phone number'
    phone = record.phone.to_s.strip
    digits = phone.scan(/\d/)
    if phone !~ /^[0-9,\,\.-]+$/
      err = emsg
    elsif phone =~ /[\,\.-]{2,}/
      err = "#{emsg}, consecutive control chars"
    elsif digits.length != 10
      err = "#{emsg}, has #{digits.length} digits"
    elsif digits[0] == '0' || digits[3] == '0'
      err = "#{emsg}, zero at index 0 or 3"
    end
    if err
      record.errors.add(:base, err)
    end
  end

end