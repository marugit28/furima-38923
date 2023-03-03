# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計
## users
|Column                  |Type    |Options                 |
| ---------------------- | ------ | ---------------------- |
|nickname                |string  |null: false             |
|email                   |string  |null: false,unique: true|
|encrypted_password      |string  |null: false             |
|last_name               |string  |null: false             |
|first_name              |string  |null: false             |
|last_name_kana          |string  |null: false             |
|first_name_kana         |string  |null: false             |
|birthday                |date    |null: false             |

### Association
has_many :items
has_many :orders

## items
|Column                |Type      |Options                      |
| ----------           | ----     | --------------------------- |
|item_name             |string    |null: false                  |
|explanation           |text      |null: false                  |
|category_id           |integer   |null: false                  |
|state_id              |integer   |null: false                  |
|region_id             |integer   |null: false                  |
|scheduled_delivery_id |integer   |null: false                  |
|shopping_fee_id       |integer   |null: false                  |
|user                  |references|null: false,foreign_key: true|
|price                 |integer   |null: false                  |



### Association
has_one :order
belongs_to :user 

## orders
|Column         |Type      |Options                      |
| ------------- | ------   | --------------------------- |
|item_name      |references|null: false,foreign_key: true|
|user           |references|null: false,foreign_key: true|
### Association
belongs_to :item
belongs_to :user
has_one :place

## places
|Column         |Type      |Options                      |
| ------------- | ------   | ---------                   |
|postcode       |string    |null: false                  |
|region_id      |references|null: false,foreign_key: true|
|municipalities |string    |null: false                  |
|address        |string    |null: false                  |
|building       |string    |                             |
|tell           |string    |null: false                  |
|item_name      |references|null: false,foreign_key: true|
|user           |references|null: false,foreign_key: true|
### Association
belongs_to :order