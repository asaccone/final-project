task({ :send_sms => :environment }) do
  # Finds foods where messages have not yet been sent. Print how many there are.
  unsent_3_day_warnings = FoodItem.where({ :message1_sent => false })
  reminder_3_day = unsent_3_day_warnings.
    where("expiration_date < ?", 72.hours.from_now + 15.minutes)

  reminder_3_day.each do |item|
    p item.description
    p item.expiration_date
    p item.message1_sent

    # Use the Twilio code from Day 5
    require("http")

     # Creating some helper variables containing credentials to keep later lines short.
      account_sid = ENV.fetch("twilio_sid")
      token = ENV.fetch("token")
      sender_number = ENV.fetch("number")

     # Putting together my API URL, as usual.
      messages_url = "https://api.twilio.com/2010-04-01/Accounts/" + account_sid + "/Messages.json"

    # This is the extra authentication step, as opposed to before.
      browser = HTTP.basic_auth({ :user => account_sid, :pass => token }) 

    # Here we assemble the data that we want to insert. Twilio wants it as a nested hash:
      data_to_post = {
          :form => {
            "Body" => "Friendly reminder that your item #{item.item_name} will expire in 3 days.",
            "From" => sender_number,
            "To" => "+1" + item.owner_id.phone_number
          }
        }

     # Finally, we call the .post method:
    browser.post(messages_url, data_to_post)

    p item.owner_id.phone_number
    item.message1_sent = true
    item.save
  end

  unsent_1_day_warnings = FoodItem.where({ :message2_sent => false })
  reminder_1_day = unsent_1_day_warnings.
    where("expiration_date < ?", 24.hours.from_now + 15.minutes)

  reminder_1_day.each do |item|
    p item.description
    p item.expiration_date
    p item.message2_sent

    # Use the Twilio code from Day 5
    require("http")

     # Creating some helper variables containing credentials to keep later lines short.
      account_sid = ENV.fetch("twilio_sid")
      token = ENV.fetch("token")
      sender_number = ENV.fetch("number")

     # Putting together my API URL, as usual.
      messages_url = "https://api.twilio.com/2010-04-01/Accounts/" + account_sid + "/Messages.json"

    # This is the extra authentication step, as opposed to before.
      browser = HTTP.basic_auth({ :user => account_sid, :pass => token }) 

    # Here we assemble the data that we want to insert. Twilio wants it as a nested hash:
      data_to_post = {
          :form => {
            "Body" => "Friendly reminder that your item #{item.item_name} will expire tomorrow.",
            "From" => sender_number,
            "To" => "+1" + item.owner_id.phone_number
          }
        }

     # Finally, we call the .post method:
    browser.post(messages_url, data_to_post)

    p item.owner_id.phone_number
    item.message2_sent = true
    item.save
  end

  unsent_throw_out = FoodItem.where({ :message3_sent => false })

  reminder_throw_out = unsent_throw_out.
    where("expiration_date < ?", from_now + 15.minutes)

  reminder_throw_out.each do |item|
    p item.description
    p item.expiration_date
    p item.message3_sent

    # Use the Twilio code from Day 5
    require("http")

     # Creating some helper variables containing credentials to keep later lines short.
      account_sid = ENV.fetch("twilio_sid")
      token = ENV.fetch("token")
      sender_number = ENV.fetch("number")

     # Putting together my API URL, as usual.
      messages_url = "https://api.twilio.com/2010-04-01/Accounts/" + account_sid + "/Messages.json"

    # This is the extra authentication step, as opposed to before.
      browser = HTTP.basic_auth({ :user => account_sid, :pass => token }) 

    # Here we assemble the data that we want to insert. Twilio wants it as a nested hash:
      data_to_post = {
          :form => {
            "Body" => "Throw out your item #{item.item_name} - it has expired.",
            "From" => sender_number,
            "To" => "+1" + item.owner_id.phone_number
          }
        }

     # Finally, we call the .post method:
    browser.post(messages_url, data_to_post)

    p item.owner_id.phone_number
    item.message3_sent = true
    item.save
  end

end