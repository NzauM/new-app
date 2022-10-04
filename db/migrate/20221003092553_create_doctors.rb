class CreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.string :name
      t.integer :phone_no

      t.timestamps
    end
  end
end
