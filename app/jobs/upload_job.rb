class UploadJob
  include Sidekiq::Worker

  def perform(args)
    puts args
    sleep 3
    rec = CsvUpload.find_by_id(args['csv_id'])
    puts rec.inspect
    rec.status = 'processing'
    rec.save!
    puts '====== JOB ========'
    rec.parse_csvfile
    puts 'done'
    rec.status = 'success'
    rec.save!
    # block that will be retried in case of failure
  end
end