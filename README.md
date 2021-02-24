# テーブル設計

## users テーブル

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| nickname              | string | null: false |
| email                 | string | null: false |
| password              | string | null: false |
| password_confirmation | string | null: false |

### Association

- has_many :items
- has_many :buys

## items テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| image             | text       | null: false                    |
| name              | string     | null: false                    |
| name_description  | text       | null: false                    |
| category          | string     | null: false                    |
| product_condition | string     | null: false                    |
| shipping_charges  | string     | null: false                    |
| shipping_area     | string     | null: false                    |
| days_to_ship      | string     | null: false                    | 
| price             | integer    | null: false                    |
| user              | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :buy

## buysテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |
| address | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :address

## addressテーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| postal_code  | integer | null: false |
| prefectures  | string  | null: false |
| municipality | string  | null: false |
| house_number | integer | null: false |
| phone_number | integer | null: false |

### Association

- belongs_to :buy