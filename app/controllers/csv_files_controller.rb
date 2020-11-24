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
      rec.email = params[:info][:email]
      rec.csvfile.purge
    else
      rec = CsvUpload.create(upload_params)
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
    # make sure db/cache settles down before client renders new data
    # not sure why this is needed but fails without it
    sleep 3 if rec.status == 'success'
    render json:({status: rec.status}.to_json)
  end

  private
  def upload_params
    params.require(:info).permit(:name, :email)
  end
end
