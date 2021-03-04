class Item < ApplicationRecord
  belongs_to :user
  has_one :buy
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40 }
    validates :name_description, length: { maximum: 1000 }
    validates :category_id
    validates :product_condition_id
    validates :shipping_charges_id
    validates :prefectures_id
    validates :days_to_ship_id
    validates :price
  end

  with_options format: { with: /\A[0-9]+\z/ } do
    validates :price
  end
  with_options numericality: { only_integer: true, greater_than: 300, less_than: 10_000_000 } do
    validates :price
  end
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :product_condition_id
    validates :shipping_charges_id
    validates :prefectures_id
    validates :days_to_ship_id
  end
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_condition
  belongs_to :shipping_charges
  belongs_to :prefectures
  belongs_to :days_to_ship
end
