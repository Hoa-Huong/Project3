class CreateTeachOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :teach_offers do |t|
      t.references :user, null: false, foreign_key: true
      t.references :demand, null: false, foreign_key: true
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
