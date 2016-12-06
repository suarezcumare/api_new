class AddInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string, null: false, limit: 30
    add_column :users, :last_name, :string, null: false, limit: 30
    add_column :users, :date_of_birth, :datetime
  end
end
