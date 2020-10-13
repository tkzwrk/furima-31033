# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| kananame | string | null: false |
| born     | date   | null: false |

### Association

- has_many :items
- has_many :buys

## itmes テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| title    | string     | null: false                    |
| text     | text       |                                |
| image    | integer    | null: false                    |
| category | string     | null: false                    |
| condition| string     | null: false                    |
| charge   | integer    | null: false                    |
| area     | string     | null: false                    |
| days     | date       | null: false                    |
| price    | integer    | null: false                    |
| user     | references | null: false, foreign_key: true |

### Association

- has_many   :buys
- belongs_to :user

## buys テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| card      | string     | null: false,                   |
| time_limit| date       | null: false,                   |
| safety    | integer    | null: false,                   |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one    :delivery

## deliverys テーブル

| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| postal_code| integer    | null: false |
| prefectures| string     | null: false |
| cities     | string     | null: false |
| add        | text       | null: false |
| bill_nam   | text       |             |
| phone      | string     | null: false |

### Association

- belongs_to :buy