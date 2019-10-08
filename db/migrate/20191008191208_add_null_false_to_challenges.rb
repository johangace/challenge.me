class AddNullFalseToChallenges < ActiveRecord::Migration[5.1]
  def change
    change_column_null :challenges, :user_id, false
    change_column_null :challenges, :content_type, false
    change_column_null :challenges, :content_id, false
  end
end
