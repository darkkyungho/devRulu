# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  content    :text
#  title      :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  image      :string(255)
#

class Post < ActiveRecord::Base
  belongs_to :user, counter_cache: true
  has_many :comments, as: :commentable

  mount_uploader :image, ImageUploader
  acts_as_taggable
end
