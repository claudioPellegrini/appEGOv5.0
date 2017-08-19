class Calificacion < ApplicationRecord
	belongs_to :compra
	
	validates :compra_id, presence: {message: "^Debe seleccionar una compra"}
	validates :valor, presence: {message: "^Debe ingresar un valor"}

	validates :compra_id, uniqueness: {message: "^Esta compra ya se encuentra valorada "}
end
