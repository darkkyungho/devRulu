class AddCommentsCountToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :comments_count, :integer, default: 0, index: true

    # Update posts' comments count
    Post.find_each do |post|
      post.update_attribute(:comments_count, post.comments.length)
      post.save
    end
  end
end
