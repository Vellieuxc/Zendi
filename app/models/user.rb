class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :comments
  belongs_to :doctor

  ROLES = %i[admin doctor patient]
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :role)
  end
  def admin?
    self.role == "admin"
  end
end
