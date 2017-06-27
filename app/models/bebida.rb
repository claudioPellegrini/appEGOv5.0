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

	def mi_stock

		saldo = Stock.where(bebida_id: self.id).sum(:cant)
		return saldo
	end
	def agrego(valor)
		mi_bebida = Stock.where(bebida_id: self.id)
		saldo = mi_bebida.last.cant + valor
		mi_bebida.update(cant: saldo )
	end
end
