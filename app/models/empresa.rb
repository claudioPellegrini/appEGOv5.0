class Empresa < ApplicationRecord
has_many :usuarios

	validates :rut, presence: {message: "^Debe ingresar un RUT"}
	validates :rut, length: { in: 12..12, message: "^Debe ingresar 12 dígitos para el RUT"}
	validates :rut, uniqueness: {message: "^Ese RUT ya se encuentra registrado "}
	validates :rut, numericality: { greater_than: 0, message: "^Debe ingresar un número válido"}

	validates :nombre, presence: {message: "^Debe ingresar un nombre"}
	validates :razon_social, presence: {message: "^Debe ingresar una Razón Social"}

	
	validates :telefono, presence: {message: "^Debe ingresar un teléfono"}
	validates :telefono, length: { in: 4..12, message: "^Debe ingresar un teléfono válido"}
	validates :telefono, numericality: { greater_than: 0, message: "^Debe ingresar un número válido"}

	validates :direccion, presence: {message: "^Debe ingresar una dirección"}

	validates :email, presence: {message: "^Debe ingresar un correo electronico"}
	EMAIL_FORMATO_VALIDO = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	validates :email, format: { :with => EMAIL_FORMATO_VALIDO , message: "^El formato del correo electronico es inválido" }
end
