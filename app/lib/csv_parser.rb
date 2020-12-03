require 'csv'

class CsvParser
  def self.parse(path, csv_rec)
    rnum = 0
    CSV.foreach(path, headers: true) do |row|
      rnum += 1
      udata = UserDatum.create(row.to_hash.merge({row: rnum}))
      if udata.valid?
        csv_rec.user_data << udata
      else
        csv_rec.error_rows << ErrorRow.create(row: rnum,
        error_msg: udata.errors.messages.map{|k,v| "#{k}: #{v[0]}"}.join(", "))
      end
    end
  end
end