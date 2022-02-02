class CreateBikeadvs < ActiveRecord::Migration[6.1]
  def change
    create_table :bikeadvs do |t|
      t.string :scuderia
      t.string :modello
      t.string :cilindrata
      t.integer :anno
      t.string :city
      t.text :description
      t.text :advices
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
