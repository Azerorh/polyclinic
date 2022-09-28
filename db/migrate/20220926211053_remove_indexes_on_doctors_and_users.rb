class RemoveIndexesOnDoctorsAndUsers < ActiveRecord::Migration[7.0]
  def change
    remove_index :users, :email
    remove_index :doctors, :email
  end
end
