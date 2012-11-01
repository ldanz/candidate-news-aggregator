class Rep
	attr_accessor :name, :title, :party, :district_num, :phone_number, :youtube_url

  def initialize(options = {})
    options.each do |attribute, value|
      self.send("#{attribute}=".to_sym, value)
    end
  end

  def self.get_legislators_in zipcode
    Sunlight::Legislator.all_in_zipcode(zipcode).map { |rep| Rep.new(name: "#{rep.firstname} #{rep.lastname}", title: rep.title, party: rep.party) }
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

  def get_news
    response = HTTParty.get("http://api.npr.org/query?fields=text,title&requiredAssets=text&searchTerm=#{URI::escape(name)}&dateType=story&output=JSON&apiKey=#{NPR_API_KEY}")
    stories = response['list']['story']
    stories.map do |story|
      title = story['title']['$text']
      text = story['text']['paragraph'].map { |paragraph| paragraph['$text']}
      {title: title, text: text}
    end
  end
end
