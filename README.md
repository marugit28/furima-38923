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
|birthday                |integer |null: false             |

### Association
has_many :objects
belongs_to :user
has_many :recodes

## objects
|Column      |Type   |Options                      |
| ---------- | ----  | --------------------------- |
|object_name |string |null: false                  |
|explanation |text   |null: false                  |
|category    |string |null: false                  |
|states      |string |null: false                  |
|load        |string |null: false                  |
|region      |string |null: false                  |
|date        |string |null: false                  |
|shopping_fee|string |null: false                  |
|seller      |string |null: false,foreign_key: true|
|price       |integer|null: false                  |



### Association
has_one :record
belongs_to :user 

## records
|Column         |Type   |Options                      |
| ------------- | ------| --------------------------- |
|object_name    |string |null: false,foreign_key: true|
|buyer          |string |null: false,foreign_key: true|
### Association
belongs_to :object
belongs_to :user
has_one :place

## places
|Column         |Type    |Options    |
| ------------- | ------ | --------- |
|postcode       |string  |null: false|
|prefecture     |string  |null: false|
|municipalities |string  |null: false|
|address        |string  |null: false|
|building       |string  |           |
|tell           |string  |null: false|

### Association
belongs_to :record