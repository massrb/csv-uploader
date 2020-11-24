class UploadJob
  include Sidekiq::Worker

  def perform(args)
    # simulate busy asynch
    sleep 5
    rec = CsvUpload.find_by_id(args['csv_id'])
    rec.user_data.destroy_all
    rec.error_rows.destroy_all
    rec.status = 'processing'
    rec.save!
    rec.parse_csvfile
    rec.status = 'success'
    rec.save! if rec.valid?
=begin    
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
=end    
  end
end