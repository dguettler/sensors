class CreateReadings < ActiveRecord::Migration
  def change
    create_table :readings do |t|
      t.integer :sensor_id
      t.string :data
      t.datetime :created_at
    end
  end
end
