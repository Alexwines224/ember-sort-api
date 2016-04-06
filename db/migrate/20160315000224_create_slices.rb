class CreateSlices < ActiveRecord::Migration
  def change
    create_table :slices do |t|
      t.string :title
      t.integer :design_id, index: true

      t.timestamps null: false
    end
  end
end
