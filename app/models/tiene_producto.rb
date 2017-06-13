class TieneProducto < ApplicationRecord
  belongs_to :menu
  belongs_to :producto
end
