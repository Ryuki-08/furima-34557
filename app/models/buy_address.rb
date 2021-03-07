class BuyAddress

  include ActiveModel::model
  attr_accessor :postal_code, :prefectures_id, :municipality, :building_name, :house_number, :phone_number, :buy_id, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefectures_id
    validates :municipality
    validates :house_number
    validates :buy_id
    validates :user_id
    validates :item_id
  end

  VALID_PHONE_NUMBER_REGEX = /\A0(\d{1}[-(]?\d{4}|\d{2}[-(]?\d{3}|\d{3}[-(]?\d{2}|\d{4}[-(]?\d{1})[-)]?\d{4}\z|\A0[5789]0[-]?\d{4}[-]?\d{4}\z/
  validates :phone_number, presence: true, format: { with: VALID_PHONE_NUMBER_REGEX }

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefectures_id: prefectures_id, municipality: municipality, building_name: building_name, house_number: house_number, phone_number: phone_number, buy_id: buy_id)
  end

end