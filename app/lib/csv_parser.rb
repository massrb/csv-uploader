
require 'csv' 

class CsvParser

	def self.parse(path, rec)
		rnum = 0
		CSV.foreach(path, :headers => true) do |row|
	  	p row.to_hash
	  	rnum += 1
	  	udata = UserDatum.create(row.to_hash.merge({row: rnum}))
	  	rec.user_data << udata
	  	puts "VALID:" + udata.valid?.to_s
	  	rescue
	  	puts "RESCUE !!!!!!!!!!!!!!!!!!!!!1"
	  	rec.error_rows << ErrorRow.create(row: rnum, 
	  		error_msg: rec.errors.messages.map{|k,v| "#{k}:#{v[0]}"}.join(", "))
		end
	end

end