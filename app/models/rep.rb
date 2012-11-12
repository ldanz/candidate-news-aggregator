class Rep
	attr_accessor :name, :title, :party, :district_num, :phone_number, :youtube_url

    #npr api search id's for each topic
    ECONOMY = '1017'
    HEALTHCARE = '1027'
    EDUCATION = '1013'

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

  def get_news filter = true
    stories = api_news_call filter
    if stories != nil
      stories.map do |story|
        title = story['title']['$text']
        text = story['text']['paragraph'].map { |paragraph| paragraph['$text']}
        {title: title, text: text}
      end
    end
  end

  def api_news_call filter
    if filter == true
      stories = []
      [ECONOMY, HEALTHCARE, EDUCATION].each do |topic|
        response = HTTParty.get("http://api.npr.org/query?#{topics_query_string topic}fields=text,title&requiredAssets=text&searchTerm=#{URI::escape(name)}&dateType=story&output=JSON&apiKey=#{NPR_API_KEY}")
        if response['list']['story'] != nil
          stories += response['list']['story']
        end
      end
      stories
    end
  end

  def topics_query_string topic
    if topic != nil
      "id=#{topic}&"
    end
  end
end
