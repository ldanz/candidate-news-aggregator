require 'spec_helper'

describe NewsFeedController do
  describe 'GET new' do
    get :new
    response.should be_success
  end
end
