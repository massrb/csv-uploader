require 'rails_helper'

Aws.config.update(
        # endpoint: 'https://objects.dreamhost.com.',
        access_key_id: Rails.application.credentials.aws[:access_key_id],
        secret_access_key: Rails.application.credentials.aws[:secret_access_key],
        force_path_style: true,
        region: Rails.application.credentials.aws[:region]
)

RSpec.describe CsvUpload do
  it "connects to s3" do
    @s3_client = Aws::S3::Client.new
    acl = @s3_client.get_bucket_acl(bucket: 'larzbucket')
    expect(acl.owner.display_name).to eq 'massrubydev'
  end
end