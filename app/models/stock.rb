class Stock < ApplicationRecord
	belongs_to :bebida
	
	validates :bebida_id, presence: {message: "^Debe seleccionar una bebida"}
	validates :cant, presence: {message: "^Debe ingresar una cantidad"}
	validates :factura_compra, presence: {message: "^Debe ingresar una factura de compra"}
end
