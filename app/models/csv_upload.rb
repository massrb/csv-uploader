require 'csv'    

class CsvUpload < ApplicationRecord
	has_one_attached :csvfile
	has_many :user_data
	
	def show_file
		csvfile.blob.open(tmpdir: "/tmp") do |file|
			p file.path

  		CSV.foreach(file.path, :headers => true) do |row|
  			p row.to_hash
			end
  	end
	end

end
