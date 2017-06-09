json.extract! empresa, :id, :rut, :nombre, :razon_social, :telefono, :direccion, :email, :created_at, :updated_at
json.url empresa_url(empresa, format: :json)
