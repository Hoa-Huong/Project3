class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.date :birth
      t.string :address
      t.string :email
      t.string :phone
      t.string :level
      t.integer :role, role: 1

      t.timestamps
    end
  end
end
