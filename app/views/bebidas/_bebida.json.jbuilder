json.extract! bebida, :id, :nombre, :tipo, :tamanio, :precio, :created_at, :updated_at
json.url bebida_url(bebida, format: :json)
