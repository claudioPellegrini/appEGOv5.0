class Tipo < ApplicationRecord
	has_many :productos, dependent: :destroy
	validates :nombre, presence: {message: "^Debe ingresar un nombre"}
	validates :descripcion, presence: {message: "^Debe ingresar una descripción"}

end
