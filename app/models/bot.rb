class Bot < ApplicationRecord

	  def self.search_words words
	 	CLIENT.search(words, lang: "en").first.text
	  end


	def self.respond name 
		#"@" + name + " " + Response.first.message
		"@" + name + " " +Response.offset(rand(Response.count)).first.message
	 end

	def self.find_user number,words
		CLIENT.search(words,lang:"en").take(number).each{|t|

		User.create(name:t.user.screen_name, tweet_id:t.id.to_s)
		
		CLIENT.update(Bot.respond(t.user.screen_name),in_reply_to_status_id:t.id)
	}
	end


end
