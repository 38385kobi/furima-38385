# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many : items
- has_many : orders

## items テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| name              | string     | null: false                    |
| description       | string     | null: false                    |
| category_id       | integer    |null: false                     |
| item_condition_id | integer    | null: false                    |
| shipping_fee_id   | integer    | null: false                    |
| prefecture_id     | integer    | null: false                    |
| delivery_date_id  | integer    | null: false                    |
| price             | integer    | null: false                    |
| user              | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one : order
- belongs_to_active_hash : category
- belongs_to_active_hash : item_condition
- belongs_to_active_hash : shipping_fee
- belongs_to_active_hash : prefecture
- belongs_to_active_hash : delivery_date

## orders テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| items         | references | null: false, foreign_key: true |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to : user
- belongs_to : item
- has_one : destination


## destination テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_code        | references | null: false,foreign_key: true  |
| prefecture_id    | integer    | null: false                    |
| city             | references | null: false,foreign_key: true  |
| address          | references | null: false,foreign_key: true  |
| building_name    | references | foreign_key: true              |
| phone_number     | references | null: false,foreign_key: true  |

### Association

- belongs_to : order
- belongs_to_active_hash : prefecture



## category (active_hash)
- has_many : items

## item_condition (active_hash)
- has_many : items

## shipping_fee (active_hash)
- has_many : items

## prefecture (active_hash)
- has_many : items
- has_many : destinations

## delivery_date (active_hash)
- has_many : items
