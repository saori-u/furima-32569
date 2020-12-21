# テーブル設計

## users テーブル

| Column              | Type   | Options                  |
| ------------------- | ------ | ------------------------ |
| nickname            | string | null: false              |
| email               | string | null: false,unique: true |
| encrypted_password  | string | null: false              |
| family_name         | string | null: false              |
| given_name          | string | null: false              |
| family_name_kana    | string | null: false              |
| given_name_kana     | string | null: false              |
| birthday            | date   | null: false              |

### Association

- has_many :items
- has_many :purchases


## items テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| name                  | string     | null: false                    |
| text                  | text       | null: false                    |
| category_id           | integer    | null: false                    |
| condition_id          | integer    | null: false                    |
| shipping_charges_id   | integer    | null: false                    |
| area_id               | integer    | null: false                    |
| delivery_time_id      | integer    | null: false                    |
| price                 | integer    | null: false                    |
| user                  | references | null: false, foreign_key: true |

### Association

- has_one    :purchaser
- belongs_to :user
- belong_to_active_hash :category
- belong_to_active_hash :state
- belong_to_active_hash :burden
- belong_to_active_hash :area
- belong_to_active_hash :shipping_date


## purchaser テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :address


## address テーブル

| Column        | Type       | Options                       |
| ------------- | ---------- | ----------------------------- |
| postcode      | string     | null: false,                  |
| prefecture_id | integer    | null: false,                  |
| city          | string     | null: false,                  |
| house_num     | string     | null: false,                  |
| building      | string     |                               |
| phone_num     | string     | null: false,                  |
| purchase      | references | null:false,foreign_key: true  |

### Association

- belong_to :purchase
- belong_to_active_hash :area