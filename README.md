# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| first_name      | string | null: false |
| last_name       | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false |
| born            | date   | null: false |

### Association

- has_many :items
- has_many :buys

## itmes テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| title         | string     | null: false                    |
| text          | text       | null: false                    |
| category_id   | integer    | null: false                    |
| condition_id  | integer    | null: false                    |
| charge_id     | integer    | null: false                    |
| area_id       | integer    | null: false                    |
| day_id        | integer    | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |
| prefectures_id| integer    | null: false                    |

### Association

- has_one    :buy
- belongs_to :user

## buys テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one    :delivery

## deliverys テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefectures_id| integer    | null: false                    |
| cities        | string     | null: false                    |
| add           | text       | null: false                    |
| bill_name     | string     |                                |
| phone         | string     | null: false                    |
| buy           | references | null: false, foreign_key: true |

### Association

- belongs_to :buy