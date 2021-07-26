# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birthday           | string | null: false |

### Association

- has_many :products
- has_many :Buyers

## products テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| item           | text       | null: false                    |
| message        | string     | null: false                    |
| category       | text       | null: false                    |
| price          | text       | null: false                    |
| item_status    | text       | null: false                    |
| shipping_cost  | text       | null: false                    |
| shipper        | text       | null: false                    |
| shipping_date  | text       | null: false                    |
| user           | references | null: false, foreign_key: true |

### Association

- has_many :Buyer
- belongs_to :user

## Buyer テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| product   | references | null: false, foreign_key: true |

### Association

- has_one    :address
- belongs_to :user
- belongs_to :products

## address テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| zip_code         | text       | null: false                    |
| prefecture       | text       | null: false                    |
| municipalities   | text       | null: false                    |
| street_number    | text       | null: false                    |
| telephone_number | text       | null: false                    |
| buyer            | references | null: false, foreign_key: true |

### Association

- belongs_to :buyer
