module UsersHelper
  def email_to_showname(email)
    email = email.split('@')
    email[0]
  end
end
