# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  avatar                 :string(255)
#  posts_count            :integer          default(0)
#  nickname               :string(255)
#  slug                   :string(255)
#

class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :nickname, use: [:slugged, :finders, :history]

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader
  
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed

  has_many :reverse_relationships, foreign_key: "followed_id",
                                    class_name: "Relationship",
                                    dependent: :destroy
  has_many :followers, through: :reverse_relationships, source: :follower

  has_many :posts
  has_many :comments

  validates :nickname, presence: true,
                       length: { within: 2..12 }
  
  # boolean 형식을 return할때는 ?를 명시한다.
  def following?(other_user)
    relationships.find_by(followed_id: other_user.id)
  end
  
  # !로 선언하면 문제가 있을시 자동으로 에러처리를 해주므로 if조건을 따로 해주지 않아도 된다.
  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end
  
  def unfollow!(other_user)
    relationships.find_by(followed_id: other_user.id).destroy!
  end

  def should_generate_new_friendly_id?
    slug.blank? || nickname_changed?
  end

  def normalize_friendly_id(input)
    input.to_s.to_url
  end
end
