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

  	rec = CsvUpload.create
  	fil = params[:csvfile]
  	rec.csvfile.attach(io: File.open(fil.path), 
  		filename: fil.original_filename, content_type: "text/csv")
  	# rec.csvfile.attach(params[:csvfile])
  	rec.name = params[:name]
  	rec.save!
  	@data = 'mydata'
  end
end
