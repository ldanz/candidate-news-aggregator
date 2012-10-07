class Rep
	attr_accessor :name, :title, :party, :district_num, :phone_number, :youtube_url

  def initialize(options = {})
    options.each do |attribute, value|
      self.send("#{attribute}=".to_sym, value)
    end
  end

  def self.get_legislators_in zipcode
    Sunlight::Legislator.all_in_zipcode(zipcode)
  end

  def party
    if self.party = "D"
      return "Democrat"
    elsif self.party = "R"
      return "Republican"
    else
      return "Unknown"
    end
  end
end
