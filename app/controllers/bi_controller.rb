class BiController < ApplicationController

	# graficas usando gema googlecharts
    def grafica_1
    	data_array_1 = [1, 4, 3, 5, 9] 
    	data_array_2 = [4, 2, 10, 4, 7] 
    	@barv = Gchart.bar( 
            :size => '600x400',
            :bar_colors => ['000000', '0088FF'],
            :title => "	 Cantidad de mujeres y hombres por salon",
            :bg => 'EFEFEF',
            :grouped => true,
            :legend => ['Mujeres ', 'Hombres'],
            :data => [[1, 4, 3, 5, 9], data_array_2],            
            :legend_position => 'top',
            :axis_with_labels => [['x'], ['y']], 
            :max_value => 15,
            :min_value => 0,
            :axis_labels => [["A|B|C|D|E"]],
            ) 

            @pastel=Gchart.pie( 
                    :size   => '600x400',
                    :title  => "Grafica de Pastel- Navegadores mas usados",
                    :legend => ['firefox', 'chrome', 'IE', 'Safari', 'Opera'],
                    :custom => "chco=FFF110,FF0000",
                    :data   => [120, 45, 25, 55, 20]
                    )

    end        
    

    

end
