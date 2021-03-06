class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, , :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :trackable
  has_many :contracts
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :admin,:name
  # attr_accessible :title, :body
end
