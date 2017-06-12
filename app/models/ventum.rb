class Ventum < ApplicationRecord
	belongs_to :menu
	belongs_to :bebida
	belongs_to :usuario
end
