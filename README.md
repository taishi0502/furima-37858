# README

## usersテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nick_name          | string | null: false |
| email              | string | null: false, unique: true|
| password           | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birthday           | string | null: false |
### Association

- has_many :items
- belongs_to :order
- has_many :purchase_histories
- belongs_to :ActiveHash :birth_date

## itemsテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| item_name          | string | null: false |
| seller             | string | null: false |
| buyer              | string | null: false |
| item_description   | text   | null: false |
| category_ id       | integer| null: false |
| condition_id       | integer| null: false |
| delivery_fee_id    | integer| null: false |
| ship_from_id       | integer| null: false |
| preparation_date_id| integer| null: false |
| price              | integer| null: false |
| user               |references | null: false, foreign_key: true |
### Association

- belongs_to :user
- belongs_to :order
- belongs_to :ActiveHash :category
- belongs_to :ActiveHash :condition
- belongs_to :ActiveHash :delivery_fee
- belongs_to :ActiveHash :ship_from
- belongs_to :ActiveHash :preparation_date

## ordersテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| card_number        | integer | null: false |
| validity           | integer | null: false |
| security_code      | integer | null: false |
| postal_code        | integer | null: false |
| prefectures        | string | null: false |
| city               | string | null: false |
| address            | integer | null: false |
| building_name      | string |  |
| phone_num          | integer | null: false |
### Association

- belongs_to :user
- belongs_to :item
- belongs_to :ActiveHash :prefecture

## purchase_historiesテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| item               | references | null: false,foreign_key: true |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
