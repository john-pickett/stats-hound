class User < ApplicationRecord

  before_save  { self.email = email.downcase}
  has_many :applications

  validates :email, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  private

  def send_confirm_email
    UserMailer.new_user(self).deliver_now
  end

end
