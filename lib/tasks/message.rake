task({ :send_sms => :environment }) do
  #3 day warning
  unsent_3_day_warnings = FoodItem.where({ :message1_sent => false })
  reminder_3_day = unsent_3_day_warnings.where("expiration_date < ?", 72.hours.from_now)

  reminder_3_day.each do |item|
    p item.expiration_date
    p item.message1_sent

    require("http")

    account_sid = ENV.fetch("twilio_sid")
    token = ENV.fetch("token")
    sender_number = ENV.fetch("number")
    recipient = item.owner_id
    phone_number = User.where({ :id => recipient }).first.phone_number

    messages_url = "https://api.twilio.com/2010-04-01/Accounts/" + account_sid + "/Messages.json"

    browser = HTTP.basic_auth({ :user => account_sid, :pass => token }) 

    data_to_post = {
        :form => {
          "Body" => "Friendly reminder that your #{item.item_name} will expire in 3 days.",
          "From" => sender_number,
          "To" => "+1" + phone_number
        }
      }

    browser.post(messages_url, data_to_post)

    item.message1_sent = true
    item.save
  end

  #1 day warning
  unsent_1_day_warnings = FoodItem.where({ :message2_sent => false })
  reminder_1_day = unsent_1_day_warnings.where("expiration_date < ?", 24.hours.from_now)

  reminder_1_day.each do |item|
    p item.expiration_date
    p item.message2_sent

    require("http")

    account_sid = ENV.fetch("twilio_sid")
    token = ENV.fetch("token")
    sender_number = ENV.fetch("number")
    recipient = item.owner_id
    phone_number = User.where({ :id => recipient }).first.phone_number

    messages_url = "https://api.twilio.com/2010-04-01/Accounts/" + account_sid + "/Messages.json"

    browser = HTTP.basic_auth({ :user => account_sid, :pass => token }) 

    data_to_post = {
        :form => {
          "Body" => "Friendly reminder that your #{item.item_name} will expire tomorrow.",
          "From" => sender_number,
          "To" => "+1" + phone_number
        }
      }

    browser.post(messages_url, data_to_post)

    item.message2_sent = true
    item.save
  end

  #Throw out message
  unsent_throw_out = FoodItem.where({ :message3_sent => false })
  reminder_throw_out = unsent_throw_out.where("expiration_date < ?", 30.minutes.from_now)

  reminder_throw_out.each do |item|
    p item.expiration_date
    p item.message3_sent

    require("http")

    account_sid = ENV.fetch("twilio_sid")
    token = ENV.fetch("token")
    sender_number = ENV.fetch("number")
    recipient = item.owner_id
    phone_number = User.where({ :id => recipient }).first.phone_number

    messages_url = "https://api.twilio.com/2010-04-01/Accounts/" + account_sid + "/Messages.json"

    browser = HTTP.basic_auth({ :user => account_sid, :pass => token }) 

    data_to_post = {
        :form => {
          "Body" => "Throw out your #{item.item_name}; it has expired!",
          "From" => sender_number,
          "To" => "+1" + phone_number
        }
      }

    browser.post(messages_url, data_to_post)

    item.message3_sent = true
    item.save
  end

end