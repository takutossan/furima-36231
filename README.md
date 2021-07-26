# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :products
- has_many :buyers

## products テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| name              | string     | null: false                    |
| message           | text       | null: false                    |
| category_id       | integer    | null: false                    |
| price             | integer    | null: false                    |
| item_status_id    | integer    | null: false                    |
| shipping_cost_id  | integer    | null: false                    |
| shipper_id        | integer    | null: false                    |
| shipping_date_id  | integer    | null: false                    |
| user              | references | null: false, foreign_key: true |

### Association

- has_one :buyer
- belongs_to :user

## Buyers テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| product   | references | null: false, foreign_key: true |

### Association

- has_one    :address
- belongs_to :user
- belongs_to :product

## addresses テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| zip_code         | string     | null: false                    |
| shipper_id       | integer    | null: false                    |
| municipalities   | string     | null: false                    |
| street_number    | string     | null: false                    |
| telephone_number | string     | null: false                    |
| building         | string     |                                |
| buyer            | references | null: false, foreign_key: true |

### Association

- belongs_to :buyer
