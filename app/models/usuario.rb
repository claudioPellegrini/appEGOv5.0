class Usuario < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :ci, presence: {message: "^Debe ingresar su cedula de identidad"}
  validates :nombres, presence: {message: "^Debe ingresar sus nombres"}
  validates :apellidos, presence: {message: "^Debe ingresar sus apellidos"}
  validates :rol, presence: {message: "^Debe seleccionar un rol"}
  
end
