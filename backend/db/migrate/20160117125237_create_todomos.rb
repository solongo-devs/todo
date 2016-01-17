class CreateTodomos < ActiveRecord::Migration
  def change
    create_table :todomos do |t|
      t.string :title
      t.string :content
      t.boolean :done
      t.datetime :done_time

      t.timestamps null: false
    end
  end
end
