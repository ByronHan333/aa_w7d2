# == Schema Information
#
# Table name: blogs
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  body       :text             not null
#  author_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Blog < ApplicationRecord
  validates :body, :title, presence: true
  validates :title, uniqueness: { scope: :author_id }

  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy
end