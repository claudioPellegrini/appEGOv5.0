class AddAuthenticationTokenToCuenta < ActiveRecord::Migration[5.0]
  def change
    add_column :cuenta, :authentication_token, :string, limit: 30
    add_index :cuenta, :authentication_token, unique: true
  end
end
