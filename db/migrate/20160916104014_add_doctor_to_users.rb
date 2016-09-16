class AddDoctorToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :doctor, foreign_key: true
  end
end
