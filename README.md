# README

## usersテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nick_name          | string | null: false |
| email              | string | null: false, unique: true|
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birthday           | date   | null: false |
### Association
- has_many :items
- has_many :purchase_histories


## itemsテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| item_name          | string | null: false |
| item_description   | text   | null: false |
| category_id        | integer| null: false |
| condition_id       | integer| null: false |
| delivery_fee_id    | integer| null: false |
| prefecture_id      | integer| null: false |
| preparation_date_id| integer| null: false |
| price              | integer| null: false |
| user               |references | null: false, foreign_key: true |
### Association
- belongs_to :user
- has_one :purchase_history
- belongs_to :ActiveHash :category
- belongs_to :ActiveHash :condition
- belongs_to :ActiveHash :delivery_fee
- belongs_to :ActiveHash :prefecture
- belongs_to :ActiveHash :preparation_date


## ordersテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| postal_code        | string | null: false |
| prefecture_id      | integer | null: false |
| city               | string | null: false |
| address            | string | null: false |
| building_name      | string |  |
| phone_num          | string | null: false |
| purchase_history   | references | null: false|
### Association
- belongs_to :purchase_history
- belongs_to :ActiveHash :prefecture


## purchase_historiesテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| item               | references | null: false,foreign_key: true |
| user               | references | null: false, foreign_key: true |
### Association
- belongs_to :item
- belongs_to :user
- has_one :order
