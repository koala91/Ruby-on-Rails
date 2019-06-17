class User < ApplicationRecord
  validates :name, presence: true
  # 上面带括号其实就是validates(:name, presence: true)
  validates :email, presence: true
end
