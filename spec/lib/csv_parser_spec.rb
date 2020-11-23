
require 'rails_helper'

RSpec.describe CsvParser do

	let(:path) { Rails.root.join('spec', 'fixtures', 'sample_errs.csv').to_s }
	let(:csv_upload) { CsvUpload.create }

	it "parses a csv file" do
		CsvParser.parse(path, csv_upload)
 		expect(CsvUpload.count).to eq 1
 		puts UserDatum.count.to_s
		expect(UserDatum.count).to_not eq 0
		expect(csv_upload.error_rows.count).to eq 2
		puts csv_upload.error_rows[0].inspect
	end

end