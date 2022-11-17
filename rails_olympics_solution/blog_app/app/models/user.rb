# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  email      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true

  has_many :blogs,
    foreign_key: :author_id,
    dependent: :destroy,
    inverse_of: :author

  has_many :comments,
    foreign_key: :author_id,
    dependent: :destroy,
    inverse_of: :author

  #  Find all the comments this user has on their blogs
  has_many :comments_on_blogs,
    through: :blogs,
    source: :comments

  #  Find all the blogs this user has commented on
  has_many :blogs_commented_on,
    through: :comments,
    source: :blog
end