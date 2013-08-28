class AddPostsCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :posts_count, :integer, default: 0, index: true

    # Update existing users' posts count
    User.find_each do |user|
      user.update_attribute(:posts_count, user.posts.length)
      user.save
    end
  end
end
