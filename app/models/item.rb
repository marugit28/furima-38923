class Item < ApplicationRecord
    validates :item_name,                       presence: true
    validates :explanation,                     presence: true
    validates :category_id,                     presence: true
    validates :state_id,                        presence: true
    validates :region_id,                       presence: true
    validates :scheduled_delivery_id,           presence: true
    validates :shopping_fee_id,                 presence: true
    validates :user,                            presence: true
    validates :price,                           presence: true

    has_one :order
    belongs_to :user
    has_one_attached :image

    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :state
    belongs_to :region
    belongs_to :scheduled_delivery
    belongs_to :shopping_fee



    validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :state_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :region_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :scheduled_delivery_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :shopping_fee_id, numericality: { other_than: 1, message: "can't be blank" }
  end
