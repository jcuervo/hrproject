class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  has_many :interview_ratings
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role
  
  validates :role, :presence => true
  
  ROLES = %w[admin moderator]
  
  def admin?
    self.role.eql?("admin") ? true : false
  end
  
  def moderator?
    self.role.eql?("moderator") ? true : false
  end
  
  

end
