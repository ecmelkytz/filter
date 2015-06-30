class CreateSsses < ActiveRecord::Migration
  def change
    create_table :ssses do |t|
      t.string :question
      t.text :answer

      t.timestamps null: false
    end
  end
end
