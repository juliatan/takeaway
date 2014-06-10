require 'rubygems'
require 'twilio-ruby'
require 'bundler/setup'

module SMS

  def send_sms(user, time)

    account_sid = ENV["TWILIO_SID"]
    auth_token = ENV["TWILIO_AUTHTOKEN"]

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token
     
    from = ENV["TWILIO_NO"] # Your Twilio number

    @client.account.messages.create(
      :from => from,
      :to => user.phone_number,
      :body => "Thank you! Your order was placed and will be delivered before #{ (time + ( 1*60*60 )).strftime("%H:%M:%S") }"
      )
    puts "Message has now been sent to #{user.name}!"
  end 

end