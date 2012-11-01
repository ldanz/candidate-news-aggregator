require 'spec_helper'

describe RepsController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index', {user_id: 1}
      response.should be_success
    end
  end
end
