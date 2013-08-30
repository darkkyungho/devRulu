# == Schema Information
#
# Table name: posts
#
#  id             :integer          not null, primary key
#  content        :text
#  title          :string(255)
#  user_id        :integer
#  created_at     :datetime
#  updated_at     :datetime
#  image          :string(255)
#  comments_count :integer          default(0)
#  slug           :string(255)
#

class Post < ActiveRecord::Base
  # Slug
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders, :history]

  # Activity feed
  include PublicActivity::Model
  tracked

  belongs_to :user, counter_cache: true
  has_many :comments, as: :commentable

  # Polymorphic association에 대한 counter_cache의 경우 
  # Post에서 접근시 readonly로 field를 보호해야함
  attr_readonly :comments_count

  mount_uploader :image, ImageUploader
  acts_as_taggable

  validates :content, presence: true,
                      length: { within: 2..1000 }

  validates :title, presence: true,
                    length: { within: 2..128 }
end
