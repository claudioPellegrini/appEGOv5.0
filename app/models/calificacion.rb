class Calificacion < ApplicationRecord
	belongs_to :compra
	before_create :calificando

	def calificando
		byebug
	end
end
