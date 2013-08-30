class AddPostsCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :posts_count, :integer, default: 0, index: true

    # Update existing users' posts count
    User.reset_column_information
    User.find_each do |u|
      User.reset_counters u.id, :posts
    end
  end
end
