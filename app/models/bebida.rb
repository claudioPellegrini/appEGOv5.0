class Bebida < ApplicationRecord
	has_many :compra_bebidas
	has_many :compras, through: :compra_bebidas
	validates :nombre, presence: {message: "^Debe ingresar un nombre"}
	validates :tipo, presence: {message: "^Debe ingresar un tipo"}
	validates :tamanio, presence: {message: "^Debe ingresar un tamaño"}
	validates :precio, presence: {message: "^Debe ingresar un precio"}
	after_create :inicializo_stock
	def inicializo_stock
		Stock.create(bebida_id: self.id, cant: "0")
	end
end
