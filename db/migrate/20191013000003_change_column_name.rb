class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :users,  :follwed_users_count,  :followed_users_count

   
  end
end
