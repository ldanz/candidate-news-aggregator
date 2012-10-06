require 'spec_helper'

describe NewsFeedController do
  describe 'GET new' do
    it 'should have a successful response' do
      get :new
      response.should be_success
    end
  end
end
