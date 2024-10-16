# Preview all emails at http://localhost:3000/rails/mailers/reservation_mailer
class ReservationMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/reservation_mailer/reserve_notification
  def reserve_notification
    ReservationMailer.with(reservation: Reservation.first).reserve_notification
  end
end
