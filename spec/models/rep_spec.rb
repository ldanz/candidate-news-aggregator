require 'spec_helper'

describe "Rep model" do
  describe 'Sunlight API get_legislator_in method' do
    it 'calls sunlight api to return legislator info by zipcode' do
      Rep.get_legislators_in(20903).should be_an_instance_of Array
      Rep.get_legislators_in(20903).count.should > 1
    end
    it 'collects accurate rep information based on the zipcode param' do
      flat_array = []
      Rep.get_legislators_in(94044).each do |rep|
        flat_array.push rep.name
      end
      flat_array.should include "Barbara Boxer"
    end
    it 'creates new Rep object from sunlight api info' do
      Rep.get_legislators_in(20903)[0].should be_an_instance_of Rep
    end
  end
end
