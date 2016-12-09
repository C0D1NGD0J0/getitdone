class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.string :location
      t.integer :user_id
      t.integer :status, default: 0
      t.date :date

      t.timestamps null: false
    end
  end
end
