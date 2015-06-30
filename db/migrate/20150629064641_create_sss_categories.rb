class CreateSssCategories < ActiveRecord::Migration
  def change
    create_table :sss_categories do |t|
      t.integer :sss_id
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
