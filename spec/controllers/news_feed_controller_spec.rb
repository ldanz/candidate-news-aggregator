require 'spec_helper'

describe NewsFeedController do
  describe 'GET new' do
    it 'should have a successful response' do
      # NOTE that this is succeeding even when the method has not been defined!
      get :new
      response.should be_success
    end
  end
end
