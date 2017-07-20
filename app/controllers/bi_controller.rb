class BiController < ApplicationController

	# graficas usando gema googlecharts
    def grafica_1
    	fechas = Array.new
    	data_array_1 = Array.new#[1, 4, 3, 5, 9] 
    	#data_array_2 = [ 0, 0, 0, 0, 0] 
    	consultaPorDia = Compra.find_by_sql("SELECT   COUNT (*) AS contador, fecha FROM compras, compra_productos WHERE compras.id = compra_productos.compra_id GROUP BY fecha ORDER BY fecha ASC;")
    	consultaPorDia.each do |cpd|
    		data_array_1.push(cpd.contador)
    		fechas.push(cpd.fecha.strftime("%d/%m") )
    	end
    	@barv = Gchart.bar( 
            :size => '600x400',
            :bar_colors => ['0088FF'],
            :title => "	 Total de compras por dia",
            :bg => 'EFEFEF',
            :grouped => true,
            :legend => ['Consumos por dia'],
            :data => [data_array_1],#, data_array_2],            
            :legend_position => 'top',
            :axis_with_labels => [['x'], ['y']], 
            :max_value => 100,
            :min_value => 0,
            :axis_labels => [fechas],
            ) 

    		nombres = Array.new
    		cantidades = Array.new
    		consulta = Producto.find_by_sql("select Productos.nombre, count(Compra_productos.producto_id)as consumos from Productos, Compra_productos where Productos.id = Compra_productos.producto_id  group by Productos.nombre ")
    		consulta.each do |c|
    			nombres.push(c.nombre)
    			cantidades.push(c.consumos)
    		end
            @pastel=Gchart.pie( 
                    :size   => '600x400',
                    :title  => "Historico de Productos mas consumidos",
                    :legend => nombres,#['firefox', 'chrome', 'IE', 'Safari', 'Opera'],
                    :labels => cantidades,
                    :custom => "chco=FE2E64,9AFE2E",
                    :data   => cantidades#[120, 45, 25, 55, 20, 90]
                    )

    end        
    

    

end
