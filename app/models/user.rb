class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_validation :ensure_firstName_length
  before_validation :ensure_lastName_length
  before_validation :format_email

  validates  :firstName,presence: true
  validates :lastName,presence: true

  

  def ensure_firstName_length
    self.firstName = firstName.strip.capitalize # trim any leading/trailing whitespace and capitalize first letter
    errors.add(:firstName, "must be at least 3 characters long") unless firstName.length >= 3
  end

  def ensure_lastName_length
    self.lastName = lastName.strip.capitalize # trim any leading/trailing whitespace and capitalize first letter
    errors.add(:lastName, "must be at least 3 characters long") unless lastName.length >= 3
  end

  # validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email address" } 
  private

  def format_email
    # binding.pry
    self.email = email.to_s.strip.downcase
    errors.add(:email, "must be a valid email address") unless URI::MailTo::EMAIL_REGEXP.match?(email)
  end



  has_many :vehicles
# binding.pry
end
