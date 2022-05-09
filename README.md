# README

## usersテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| address            | string | null: false |
### Association

- has_many :items
- belongs_to :ActiveHash :birth_date

## itemsテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| item_name          | string | null: false |
| seller             | string | null: false |
| buyer              | string | null: false |
| text               | string | null: false |
| category_ id       | string | null: false |
| condition_id       | string | null: false |
| delivery_fee_id    | string | null: false |
| ship_from_id       | string | null: false |
| preparation_date_id| string | null: false |
| price              | string | null: false |
| image              | string | null: false |
| brand              | string | null: false |
| user_id            | string | null: false |
### Association

- belongs_to :user
- belongs_to :ActiveHash :category
- belongs_to :ActiveHash :condition
- belongs_to :ActiveHash :delivery_fee
- belongs_to :ActiveHash :ship_from
- belongs_to :ActiveHash :preparation_date