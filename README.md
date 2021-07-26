# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| encrypted_password | string | null: false |
| name               | string | null: false |

### Association

- has_many :products
- has_many :Buyer

## products テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| item       | string     | null: false                    |
| category   | text       | null: false                    |
| price      | text       | null: false                    |
| seller     | text       | null: false                    |
| user       | references | null: false, foreign_key: true |

### Association

- has_many :Buyer
- belongs_to :user

## Buyer テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| credit    | stiring    | null: false                    |
| user      | references | null: false, foreign_key: true |
| product   | references | null: false, foreign_key: true |

### Association

- has_one    :address
- belongs_to :user
- belongs_to :products

## address テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| name      | text       | null: false                    |
| address   | text       | null: false                    |
| buyer     | references | null: false, foreign_key: true |

### Association

- belongs_to :buyer
