class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.string :name
      t.string :url
      t.string :token

      t.timestamps
    end
  end
end
