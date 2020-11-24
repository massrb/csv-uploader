class CsvUpload < ApplicationRecord
  has_one_attached :csvfile
  has_many :user_data, dependent: :destroy
  has_many :error_rows, dependent: :destroy

  def parse_csvfile
    logger.info("CSVFILE:" + csvfile.inspect)
    csvfile.blob.open(tmpdir: Rails.root.join("tmp")) do |file|
      CsvParser.parse(file.path, self)
    end
  end
end
