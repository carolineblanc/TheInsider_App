class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 5 }

     def send_sms(number, request)
   		account_sid = "AC28c6d153d9902e269609c65ce54fd2e6"
  		auth_token = "e38c57b9b33fd5e67185c3e417cd5488"

  		client = Twilio::REST::Client.new account_sid, auth_token
 
  		client.account.messages.create(
    		:from => '6179970614',
    		:to => number,
    		:body => "Hey, read the article here: #{request}/articles/#{self.id}!"
  		)
  		puts "Sent message to #{number}"
	end
end
