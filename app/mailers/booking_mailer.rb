class BookingMailer < ApplicationMailer
    
default from: "from@example.com"

  def booking_email
     mail to: 'aoshima.arata@gmail.com', subject: "新しい本の予約が登録されました"
  end
end
