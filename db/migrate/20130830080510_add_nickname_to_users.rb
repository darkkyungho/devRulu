class AddNicknameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :nickname, :string

    User.reset_column_information
    User.find_each do |u|
      u.update_attribute(:nickname, "#{u.id}_nickname")
      u.save
    end
  end
end
