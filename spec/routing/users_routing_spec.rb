require "spec_helper"

describe UsersController do
  describe "routing" do

    it 'routes users#new to root' do
      get '/'
       current_page.should route_to(new_user_path)
    end
  end
end
