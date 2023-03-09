class Item < ApplicationRecord
   extend ActiveHash::Associations::ActiveRecordExtensions
  #  has_one :order
   belongs_to :user
   has_one_attached :image
   
   belongs_to :category
   belongs_to :state
   belongs_to :region
   belongs_to :scheduled_delivery
   belongs_to :shopping_fee


    validates :image,                           presence: true,unless: :was_attached?
    validates :item_name,                       presence: true
    validates :explanation,                     presence: true
    validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :state_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :region_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :scheduled_delivery_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :shopping_fee_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :price,                           presence: true, numericality:{ only_integer: true, greater_than_or_equal_to:300, less_than_or_equal_to: 9_999_999}
    
  def was_attached?
    image.attached?
  end
end