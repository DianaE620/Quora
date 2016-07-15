 class User < ActiveRecord::Base
  # Remember to create a migration!
  include BCrypt

  validates :email, :name, uniqueness: true

  has_many :questions
  has_many :answers_received, through: :questions, source: :answers
  has_many :answers_written, class_name: "Answer", foreign_key: "user_id"


  def self.authenticate(email, user_password)
    user = User.find_by(email: email)
    if user && (user.password == user_password)
      return user
    else
      nil
    end
  end

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end

end
