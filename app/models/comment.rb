# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  content          :text
#  commentable_id   :integer
#  commentable_type :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#  user_id          :integer
#

class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :commentable, polymorphic: true, counter_cache: true

  validates :content, presence: true,
                      length: { within: 2..140 }
end
