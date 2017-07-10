class Cuentum < ApplicationRecord
	acts_as_token_authenticatable
# field :authentication_token
  
	has_one :usuario
	has_many :compras, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
