
require 'rails_helper'

RSpec.describe UserDatum, :type => :model do
	let(:csv) { CsvUpload.new }
	let(:user)  { described_class.new }
	let(:user2) { described_class.new(email: 'xxx@y.com', phone: '333-222-4444') }

	before do
		csv.user_data << user
		csv.user_data << user2
	end

  it "is not valid with empty attributes" do
    expect(user).to_not be_valid
  end

  it "belongs to csv" do
  	expect(user.csv_upload).to eq csv
  end

  it "is not valid without an email" do
  	user.email = 'bob'
  	expect(user).to_not be_valid
  end

  it "is valid with an email and phone" do
  	expect(user2).to be_valid
  end	

  it "is invalid without 10 digits" do
  	user2.phone = '123456789012'
  	expect(user2).to_not be_valid
  end

  it "is valid with commas" do
		user2.phone = '123,4567890'
  	expect(user2).to be_valid
  end

  it "is valid with dots" do
		user2.phone = '123.4567.890'
  	expect(user2).to be_valid
  end

  it "is invalid with zero at index 0" do
		user2.phone = '023.4567.890'
  	expect(user2).to_not be_valid
  end

  it "is invalid with zero at index 3" do
		user2.phone = '123.0567.890'
  	expect(user2).to_not be_valid
  end


  it "is invalid with consecutive control chars" do
  	user2.phone = '123--4567890'
  	expect(user2).to_not be_valid
  end


end