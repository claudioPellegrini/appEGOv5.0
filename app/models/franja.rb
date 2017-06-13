class Franja < ApplicationRecord

	
	validates :segunda_hasta, presence: true
	validates :primera_precio, presence: true
	validates :segunda_precio, presence: true
	validates :tercera_precio, presence: true



	validates :primera_hasta, presence: true,
		numericality: { less_than: :segunda_hasta, message: "^Debe ser menor a la segunda franja de sueldos" }
	validates :segunda_hasta, numericality: { greater_than: :primera_hasta, message: "^Debe ser mayor a la primera franja de sueldos" }
	validates :primera_precio, numericality: { less_than: :segunda_precio, message: "^Debe ser menor a precio de segunda franja sueldos" }
  	validates :segunda_precio, numericality: { greater_than_or_equal: :primera_precio, less_than: :tercera_precio, message: "^Debe ser mayor a precio de primera franja  y menor a precio de tercera franja de sueldos" }
	validates :tercera_precio, numericality: { greater_than: :segunda_precio, message: "^Debe ser mayor a precio de segunda franja sueldos" }
	



end
