class CreateMenus < ActiveRecord::Migration[5.0]
  def change
    create_table :menus do |t|
      t.date :fecha

      t.timestamps
    end
  end
end
