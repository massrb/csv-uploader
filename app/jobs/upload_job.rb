class UploadJob
  include Sidekiq::Worker

  def perform(args)
    puts args
    sleep 3
    puts 'done'
    # block that will be retried in case of failure
  end
end