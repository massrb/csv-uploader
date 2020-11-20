require 'test_helper'

class CsvFilesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get csv_files_index_url
    assert_response :success
  end

  test "should get show" do
    get csv_files_show_url
    assert_response :success
  end

end
