class Item < ApplicationRecord
  belongs_to :user
  has_one :buy
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :name_description
    validates :category_id
    validates :product_condition_id
    validates :shipping_charges_id
    validates :prefectures_id
    validates :days_to_ship_id
    validates :price
  end

  with_options format: { with: /\A[0-9]+\z/} do
    validates :price
  end
  with_options numericality: { only_integer: true, greater_than: 300, less_than: 10000000}
    validates :price
  end

  validates :category_id, numericality: { other_than: 1 }
  validates :product_condition_id, numericality: { other_than: 1 }
  validates :shipping_charges_id, numericality: { other_than: 1 }
  validates :prefectures_id, numericality: { other_than: 1 }
  validates :days_to_ship_id, numericality: { other_than: 1 }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping
  belongs_to :prefectures
  belongs_to :days_to_ship
end
