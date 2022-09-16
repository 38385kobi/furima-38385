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

## items テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| image          | string     | null: false                    |
| name           | string     | null: false                    |
| description    | string     | null: false                    |
| item_condition | string     | null: false                    |
| shipping_fee   | string     | null: false                    |
| prefecture     | string     | null: false                    |
| delivery_date  | string     | null: false                    |
| price          | string     | null: false                    |
| seller_user_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one : order

## orders テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| items_id      | references | null: false, foreign_key: true |
| buyer_user_id | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- has_one : destination


## destination テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code     | string     | null: false                    |
| prefecture    | string     | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |

### Association

- belongs_to : item