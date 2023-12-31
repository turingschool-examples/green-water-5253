class CreatePlots < ActiveRecord::Migration[7.0]
  def change
    create_table :plots do |t|
      t.integer :number
      t.string :size
      t.string :direction
      t.references :garden, null: false, foreign_key: true

      t.timestamps
    end
  end
end
