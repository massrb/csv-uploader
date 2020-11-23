class CsvFilesController < ApplicationController
	# skip_before_action :verify_authenticity_token
  def index
    puts "IDX !!!!!!!!!1"
  end

  def show
    puts 'SHOW !!!!!!!!'
  end

  def create
  	puts params.inspect
  	puts "FILE:"

    rec = CsvUpload.find_by_name(params[:info][:name])
    if rec
      puts 'GOT PREVIOUS REC !!!!!!!!!!!!!!'
    else
  	  rec = CsvUpload.create(upload_params)
      puts "REC:" + rec.inspect[0..200]
    end
  	fil = params[:csvfile]
  	rec.csvfile.attach(io: File.open(fil.path), 
  		filename: fil.original_filename, content_type: "text/csv")
  	# rec.csvfile.attach(params[:csvfile])
  	rec.save!
    UploadJob.perform_async({csv_id: rec.id})
  	@data = 'mydata'
  end

  private

  def upload_params
    params.require(:info).permit(:name, :email)
  end
end
