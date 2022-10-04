class CreateDoctorspecialties < ActiveRecord::Migration[7.0]
  def change
    create_table :doctorspecialties do |t|
      t.integer :doctor_id
      t.integer :specialty_id

      t.timestamps
    end
  end
end
