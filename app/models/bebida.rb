class Bebida < ApplicationRecord
	has_many :stocks
	has_many :compra_bebidas
	has_many :compras, through: :compra_bebidas
	validates :nombre, presence: {message: "^Debe ingresar un nombre"}
	validates :tipo, presence: {message: "^Debe ingresar un tipo"}
	validates :tamanio, presence: {message: "^Debe ingresar un tamaño"}
	validates :precio, presence: {message: "^Debe ingresar un precio"}
	after_create :inicializo_stock
	before_destroy :destroy_bebida
	
	def inicializo_stock		
		Stock.create(bebida_id: self.id, cant: "0", factura_compra: "0")
	end


	def destroy_bebida
		Stock.where(bebida_id:self.id).destroy_all
	end

	def mi_stock
		sal = Stock.where(bebida_id: self.id).last
		if sal != nil
			saldo = sal.cant
			return saldo
		else
			return 0
		end
		
	end


end
