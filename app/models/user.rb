class User < ApplicationRecord
  has_many :microposts, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum:50 }
  # 上面带括号其实就是validates(:name, presence: true)
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
                    length: { maximum:255 }, 
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: { case_sensitive:false }
  
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  def feed
    Micropost.where("user_id = ?", id)
  end
  
  # 关注一个用户
  def follow(other_user)
    active_relationships.create(follower_id: other_user.id)
  end

  # 取消关注一个用户
  def unfollow(other_user)(
    active_relationships.find_by(follower_id: other_user.id).destroy
  end
  
  # 如果当前用户关注了指定的用户，返回true
  def following?(other_user)
    following.include?(other_user)
  end
end
