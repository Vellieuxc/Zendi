class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :comments
  has_many :upvotes
  belongs_to :doctor
  has_attachment :avatar

  ROLES = %i[admin doctor patient]
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :role)
  end
  def admin?
    self.role == "admin"
  end
  def voted_for?(comment)
    comment.upvotes.where(user: self).any?
  end
end
