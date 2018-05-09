class Category < ApplicationRecord
  validates :name, presence: true

  has_many :albums, dependent: :destroy

  scope :order_name, ->{order created_at: :desc}
  scope :search_by_name, ->search do
    select(:id, :name).where "name LIKE ?", "%#{search}%"
  end
end
