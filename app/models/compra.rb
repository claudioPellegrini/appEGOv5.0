class Compra < ApplicationRecord
	belongs_to :cuentum
	after_create :save_comprados
	after_update :edit_comprados
	has_many :compra_productos
	has_many :productos, through: :compra_productos
	has_many :compra_bebidas
	has_many :bebidas, through: :compra_bebidas
	after_create :actualizo_stock
	before_destroy :actualizo_stock_destroy

	def productos=(value)

		@productos = value
	end
	def bebidas=(value)
		@bebidas = value
	end

	def save_comprados
		byebug
		if @productos != nil
			@productos.each do |producto_id|
				CompraProducto.create(producto_id: producto_id, compra_id: self.id)
			end
		end
		if @bebidas != nil
			@bebidas.each do |bebida_id|
				CompraBebida.create(bebida_id: bebida_id, compra_id: self.id)

			end
		end
	end
	def actualizo_stock
		if @bebidas != nil
			@bebidas.each do |bebida_id|
				
				mi_bebida = Stock.where(bebida_id: bebida_id)
				saldo = mi_bebida.last.cant - 1
				mi_bebida.update(cant: saldo )
				
			end
		end
	end

	def edit_comprados
		
		CompraProducto.where(compra_id: self.id).destroy_all
		if @productos != nil
			@productos.each do |producto_id|
			
			CompraProducto.create(producto_id: producto_id, compra_id: self.id)
			
			end
		end
		
		CompraBebida.where(compra_id: self.id).destroy_all
		if @bebidas != nil
			@bebidas.each do |bebida_id|
			
			CompraBebida.create(bebida_id: bebida_id, compra_id: self.id)
			
			end
		end
	end

	def destroy_comprados
		CompraProducto.where(compra_id:self.id).destroy_all
		CompraBebida.where(compra_id:self.id).destroy_all

	end

	def actualizo_stock_destroy
		
		if self.bebidas != nil
			
			self.bebidas.each do |bebida_id|
				
				mi_bebida = Stock.where(bebida_id: bebida_id)
				saldo = mi_bebida.last.cant + 1
				mi_bebida.update(cant: saldo )
				
			end
		end
		destroy_comprados
	end
end
