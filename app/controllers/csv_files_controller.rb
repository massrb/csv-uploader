class CsvFilesController < ApplicationController
	# skip_before_action :verify_authenticity_token
  def index
  end

  def show
  end

  def create
  	puts params.inspect
  	@data = 'mydata'
  end
end
