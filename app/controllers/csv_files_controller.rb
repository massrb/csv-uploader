class CsvFilesController < ApplicationController
  # skip_before_action :verify_authenticity_token
  def index
    @csv_uploads = CsvUpload.all
  end

  def show
    @csv_upload = CsvUpload.find_by_id(params[:id])
  end

  def create
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
    rec.save!
    UploadJob.perform_async({csv_id: rec.id})
    @recid = rec.id
  end

  def check
    rec = CsvUpload.find_by_id(params[:id])
    render json:({status: rec.status}.to_json)
  end

  private
  def upload_params
    params.require(:info).permit(:name, :email)
  end
end
