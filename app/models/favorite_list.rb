class FavoriteList < ApplicationRecord
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :ratings, as: :ratable, dependent: :destroy
  belongs_to :user
end
