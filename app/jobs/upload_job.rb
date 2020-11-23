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
    rec.save! if rec.valid?
    if !rec.valid?
      puts 'NOT VALID !!!!!!!!'
      puts rec.errors.inspect
      rec.user_data.each do |r|
        if !r.valid?
          puts r.inspect
          puts r.errors.inspect
        end
      end
    end
    # block that will be retried in case of failure
  end
end