
require 'csv' 

class CsvParser

	def self.parse(path, rec)
		rnum = 1
		CSV.foreach(path, :headers => true) do |row|
  		p row.to_hash if rnum < 5
  		rec.user_data << UserDatum.create(row.to_hash.merge({row: rnum}))
  		rnum += 1
		end
	end

end