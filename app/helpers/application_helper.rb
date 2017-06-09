module ApplicationHelper
	# def tipo_options
 #    [
 #      endTipo.all.pluck(:nombre)
      
 #    ]
  #end

  def tipo_bebidas
  	[	
		['Comun'],
		['Light'],
		['Zero'],
		['Otros'],
  	]
  end
  def tamanio_bebidas
  	[	
		['500'],
		['600'],
		['Litro'],
		['1.25'],
  	]
  end
end
