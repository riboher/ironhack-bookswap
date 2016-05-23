class ReaderMailerPreview < ActionMailer::Preview
  def swap_mail_preview
    ReaderMailer.swap_mail(Book.first)
  end
end
