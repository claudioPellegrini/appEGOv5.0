class CompraProducto < ApplicationRecord
  belongs_to :compra
  belongs_to :producto
end
