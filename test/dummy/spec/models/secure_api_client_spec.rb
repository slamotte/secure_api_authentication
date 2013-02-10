require 'spec_helper'

describe SecureApiClient do

  it "should be able to generate a new api key upon request" do
    secure_api_client = SecureApiClient.new
    secure_api_client.gen_api_key
    secure_api_client.api_key.should_not be_nil
  end

  it "should be able to generate a new secret upon request" do
    secure_api_client = SecureApiClient.new
    secure_api_client.gen_secret
    secure_api_client.secret.should_not be_nil
  end

  it "should save a valid client" do
    SecureApiClient.should have(0).records
    secure_api_client = FactoryGirl.build :secure_api_client
    secure_api_client.save
    SecureApiClient.should have(1).record
  end
  
  it "should not allow an empty name on create" do
    secure_api_client = FactoryGirl.build :secure_api_client
    secure_api_client.name = nil
    secure_api_client.should_not be_valid
  end
  
  it "should not allow an empty description on create" do
    secure_api_client = FactoryGirl.build :secure_api_client
    secure_api_client.description = nil
    secure_api_client.should_not be_valid
  end
  
  it "should enforce unique api keys" do
    secure_api_client1 = FactoryGirl.build :secure_api_client
    secure_api_client1.save
    secure_api_client2 = FactoryGirl.build :secure_api_client
    secure_api_client2.should_not be_valid
  end
  
  it "should set is_master to false if not explicitly set" do
    secure_api_client = SecureApiClient.new(:name => "Test", :description => "Test")
    secure_api_client.should be_valid
    secure_api_client.is_master.should == false
  end
  
end
