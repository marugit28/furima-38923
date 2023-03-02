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

## users
|Column         |Type    |Options                 |
| ------------- | ------ | ---------------------- |
|nickname       |string  |null: false             |
|email          |string  |null: false,unique: true|
|password       |string  |null: false             |
|password       |string  |null: false             |
|last_name      |string  |null: false             |
|first_name     |string  |null: false             |
|last_name_kana |string  |null: false             |
|first_name_kana|string  |null: false             |

### Association
has_many :objects
belongs_to :user
has_many :recodes

## objects
|Column      |Type  |Options                      |
| ---------- | ---- | --------------------------- |
|object_name |string|null: false                  |
|seller      |string|null: false,foreign_key: true|
|price       |integer|null: false                 |
|explanation |text   |null: false                 |

### Association
has_one :record
belongs_to :user 

## records
|Column         |Type   |Options                      |
| ------------- | ------| --------------------------- |
|buy            |boolean|null: false                  |
|object_name    |string |null: false,foreign_key: true|
|price          |integer|null: false,foreign_key: true|
|buyer          |string |null: false,foreign_key: true|
### Association
belongs_to :object
belongs_to :user
has_one :record

## places
|Column         |Type    |Options    |
| ------------- | ------ | --------- |
|postcode       |integer |null: false|
|municipalities |string  |null: false|
|address        |integer |null: false|
|building       |string  |           |
|tell           |integer |null: false|

### Association
belongs_to :object