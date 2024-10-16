class ReservationMailer < ApplicationMailer
  def reserve_notification
    @reservation = params[:reservation]
    mail to: Admin.pluck(:email), subject: default_i18n_subject
  end
end
