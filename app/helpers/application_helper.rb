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

  def rol_usuario
  	[	
		['ADMINISTRADOR'],
		['OPERARIO'],
		['USUARIO'],
  	]
  end

  def califico_compra
    [
      '0 - MALA',
      '1 - POBRE',
       '2 - ACEPTABLE',
       '3 - BUENA',
      '4 - MUY BUENA',
       '5 - EXCELENTE'
    ] 
  end

  def tipo_de_pedido
    [ 
    ['COMEDOR'],
    ['DELIVERY'],
    ]
  end
end
