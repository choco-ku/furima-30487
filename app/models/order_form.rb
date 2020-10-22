class OrderForm
  include ActiveModel::Model
  attr_accessor :post_code, :shipping_place_id, :city, :house_num, :building, :telephone, :user_id, :item_id, :token

    with_options presence: true do
      validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
      validates :shipping_place_id, numericality: { other_than: 1, message: "can't be blank" }
      validates :city
      validates :house_num
      validates :telephone, format: {with: /\A\d{11}\z/}
      validates :token
    end

    def save
      purchase = Purchase.create(user_id: user_id, item_id: item_id)
      Address.create(post_code: post_code, shipping_place_id: shipping_place_id, city: city, house_num: house_num, building: building, telephone: telephone, purchase_id: purchase.id)
    end

end