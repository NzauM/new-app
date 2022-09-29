class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :nickname
      t.string :hobby

      t.timestamps
    end
  end
end
