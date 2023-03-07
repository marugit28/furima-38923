class Item < ApplicationRecord
  create_table :items do |t|
    validates :item_name,                       precense: true
    validates :explanation,                     precense: true
    validates :category_id,                     precense: true
    validates :state_id,                        precense: true
    validates :region_id,                       precense: true
    validates :scheduled_delivery_id,           precense: true
    validates :shopping_fee_id,                 precense: true
    validates :user,                            precense: true, foreign_key: true
    validates :price,                           precense: true

    has_one :order
    belongs_to :user
    has_one_attached :image
  end
end
