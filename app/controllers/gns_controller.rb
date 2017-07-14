class GnsController < ApplicationController

	def consumos
		$fechaInicial = nil
		$fechaFinal = nil
		# $fechaInicial = Date.civil(params[:consultaConsumos][:"fechaIni(1i)"].to_i, params[:consultaConsumos][:"fechaIni(2i)"].to_i, params[:consultaConsumos][:"fechaIni(3i)"].to_i)
		# $fechaFinal = Date.civil(params[:consultaConsumos][:"fechaFin(1i)"].to_i, params[:consultaConsumos][:"fechaFin(2i)"].to_i, params[:consultaConsumos][:"fechaFin(3i)"].to_i)
		
		if valid_date?
			if $fechaFinal > $fechaInicial
				redirect_to "/gns/consultaConsumos.xlsx"
			else
				flash[:error] = "La fecha inicial debe ser menor a la fecha final"
		  		redirect_to :action => "index"
			end
		else
			flash[:error] = "Ha ingresado una fecha NO valida, verifique y vuelva a intentarlo"
		  	redirect_to :action => "index"
		end
	end


	def consultaConsumos
		# @consumos = Compra.where('fecha BETWEEN ? AND ?', $fechaInicial, $fechaFinal)
		# @consumos = Usuario.select('nombres, apellidos, (select sum( distinct Compras.cuentum_id)as consumos from Compras, Usuarios where Usuarios.cuenta_id = Compras.cuentum_id )').where(cuenta_id: Compra.select('cuentum_id').where('fecha BETWEEN ? AND ?', $fechaInicial, $fechaFinal))
		@consumos = Usuario.find_by_sql("select nombres, apellidos, count(distinct Compras.created_at)as consumos from Compras, Usuarios where Usuarios.cuenta_id = Compras.cuentum_id group by Usuarios.nombres, Usuarios.apellidos")
		respond_to do |format| 
       		format.xlsx {render xlsx: 'consultaConsumos',filename: "consultaConsumos.xlsx"}
    	end    	
    end


    def valid_date?
	  begin
	    $fechaInicial = Date.civil(params[:consultaConsumos][:"fechaIni(1i)"].to_i, params[:consultaConsumos][:"fechaIni(2i)"].to_i, params[:consultaConsumos][:"fechaIni(3i)"].to_i)
		$fechaFinal = Date.civil(params[:consultaConsumos][:"fechaFin(1i)"].to_i, params[:consultaConsumos][:"fechaFin(2i)"].to_i, params[:consultaConsumos][:"fechaFin(3i)"].to_i)
	    return true
	  rescue => e
	    return false
	  end
	end

	def consumos_params
      params.require(:consultaConsumos).permit(:fechaIni, :fechaFin)
    end
end
