class Rep 
	attr_accessor :name, :title, :party, :district_num, :phone_number, :youtube_url

	def initialize(name = "", title = "", party = "", district_num = "", phone_number = "", youtube_url = "")
		@name, @title, @party, @district_num, @phone_number, @youtube_url = :name, :title, 
			:party, :district_num, :phone_number, :youtube_url
	end


end