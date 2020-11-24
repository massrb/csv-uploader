
require 'csv' 

class CsvParser

	def self.parse(path, csv_rec)
		rnum = 0
		CSV.foreach(path, :headers => true) do |row|
	  	p row.to_hash
	  	rnum += 1
	  	udata = UserDatum.create(row.to_hash.merge({row: rnum}))
	  	csv_rec.user_data << udata
	  	puts "VALID:" + udata.valid?.to_s
	  	unless udata.valid?
	  		csv_rec.error_rows << ErrorRow.create(row: rnum, 
	  		error_msg: udata.errors.messages.map{|k,v| "#{k}: #{v[0]}"}.join(", "))
        udata.destroy
	  	end
		end
	end

end