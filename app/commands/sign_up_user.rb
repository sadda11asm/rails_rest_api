class SignUpUser
  prepend SimpleCommand

  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    u = user
    u ? JsonWebToken.encode(user_id: u.id) : nil
  end

  private

  attr_accessor :email, :password

  def user
    user = User.find_by_email(email)
    if user
      errors.add :user_signup, 'email already exists'
      return nil
    end
    new_user = User.create!(email: email , password: password)
    new_user ? new_user : nil
  end
end