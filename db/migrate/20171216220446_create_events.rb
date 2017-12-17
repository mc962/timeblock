class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.datetime :time, null: false
      t.string :location, null: false
      t.string :title
      t.text :description
      t.text :comments

      t.timestamps
    end

    add_index :events, :title
  end
end
