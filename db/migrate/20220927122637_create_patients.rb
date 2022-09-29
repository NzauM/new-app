class CreatePatients < ActiveRecord::Migration[7.0]
  def change
    create_table :patients do |t|
      t.string :firstname
      t.string :lastname
      t.integer :doctor_id
      t.integer :age
      t.string :gender

      t.timestamps
    end
  end
end
