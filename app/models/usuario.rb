class Usuario < ApplicationRecord
belongs_to :empresa, optional: true
belongs_to :cuenta, optional: true

	validates :ci, presence: {message: "^Debe ingresar su cedula de identidad"}
	validates :ci, length: { in: 7..8, message: "^Debe ingresar 7 u 8 digitos para la CI"}
	validates :ci, uniqueness: {message: "^Esa cedula ya se encuentra registrada "}
	validates :ci, numericality: { greater_than: 0, message: "^Debe ingresar un numero valido"}


	
  validates :nombres, presence: {message: "^Debe ingresar sus nombres"}
  validates :apellidos, presence: {message: "^Debe ingresar sus apellidos"}
  validates :rol, presence: {message: "^Debe seleccionar un rol"}

  validates :empresa_id, presence: {message: "^Debe seleccionar una empresa"}

	validates :cuenta_id, presence: {message: "^Debe seleccionar una cuenta"}  
	validates :cuenta_id, uniqueness: {message: "^Esa cuenta ya se encuentra asociada "}
end
