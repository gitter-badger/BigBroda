require File.expand_path(File.dirname(__FILE__) + '../../spec_helper')

describe "Config" do
  before(:all) do
    config_setup
    @auth = GoogleBigquery::Auth.new
  end

  it "authorization object" do
    VCR.use_cassette('auth') do
      @auth.authorize
      @auth.api.class.should be Google::APIClient::API
      GoogleBigquery::Auth.api.class.should be Google::APIClient::API
      GoogleBigquery::Auth.client.class.should be Google::APIClient
    end
  end

end






