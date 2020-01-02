# encoding: utf-8

class Notifier < ActionMailer::Base
  def wellcome_message(user)
    mail(to: user.email, subject: "Wellcome to themed app!") do |format|
      format.html { render 'wellcome_message' }
    end
  end

  def good_bye_message(user)
    mail(to: user.email, subject: "Good bye from themed app!") do |format|
      format.html { render 'good_bye_message' }
    end
  end
end