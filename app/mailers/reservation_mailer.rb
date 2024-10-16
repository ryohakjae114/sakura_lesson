class ReservationMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.reservation_mailer.reservation_notification.subject
  #
  def reservation_notification
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
