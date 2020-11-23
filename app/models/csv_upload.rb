class CsvUpload < ApplicationRecord
	has_one_attached :csvfile
	has_many :user_data
	has_many :error_rows

	def parse_csvfile
		csvfile.blob.open(tmpdir: "/tmp") do |file|
			CsvParser.parse(file.path, self)
  	end
	end
end
