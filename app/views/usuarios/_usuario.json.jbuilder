json.extract! usuario, :id, :ci, :nombres, :apellidos, :rol, :habilitado, :created_at, :updated_at
json.url usuario_url(usuario, format: :json)
