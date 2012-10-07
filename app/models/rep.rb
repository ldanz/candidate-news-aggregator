class Rep 
	attr_accessor :name, :title, :party, :district_num, :phone_number, :youtube_url

  def initialize(options = {})
    options.each do |attribute, value|
      self.send("#{attribute}=".to_sym, value)
    end
  end
end
