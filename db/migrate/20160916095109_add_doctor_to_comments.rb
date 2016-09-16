class AddDoctorToComments < ActiveRecord::Migration[5.0]
  def change
    add_reference :comments, :doctor, foreign_key: true
  end
end
