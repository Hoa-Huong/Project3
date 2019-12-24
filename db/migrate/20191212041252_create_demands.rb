class CreateDemands < ActiveRecord::Migration[6.0]
  def change
    create_table :demands do |t|
      t.references :user, null: false, foreign_key: true
      t.string :subject
      t.integer :amount_student
      t.string :level
      t.float :time_per_session
      t.string :fee
      t.text :note
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
