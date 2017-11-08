class AddUserIdToComments < ActiveRecord::Migration[5.0]
  def change  	  
  	add_column :comments, :user_id , :integer, :references => "users", index: true
  end  
end
