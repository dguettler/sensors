class CreateSensors < ActiveRecord::Migration
  def change
    create_table :sensors do |t|
      t.string :type
    end
  end
end
