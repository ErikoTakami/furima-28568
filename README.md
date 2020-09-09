## usersテーブル

| Column                 | Type       | Options     |
| ---------------------- | ---------- | ----------- |
| nickname               | string     | null: false |
| email                  | string     | null: false |
| password               | string     | null: false |
| password_confirmation  | string     | null: false |
| last_name              | string     | null: false |
| first_name             | string     | null: false |
| last_name_kana         | string     | null: false |
| first_name_kana        | string     | null: false |
| birthday               | date       | null: false |

### Association
- has_many :items
- has_many :purchases

## itemsテーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| name                 | string     | null: false                    |
| text                 | text       | null: false                    |
| category             | integer    | null: false                    |
| status               | integer    | null: false                    |
| shipping_charges     | integer    | null: false                    |
| shipping_origin      | integer    | null: false                    |
| days_until_shipping  | integer    | null: false                    |
| price                | integer    | null: false                    |
| user                 | references | null: false, foreign_key: true |

### Association
- has_one :purchase
- belongs_to :user

## purchasesテーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |

### Association
- has_one :shipping_address
- belongs_to :user
- belongs_to :item

## shipping_addressesテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code     | string     | null: false                    |
| prefecture    | integer    | null: false                    |
| city          | string     | null: false                    |
| block         | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| purchase      | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase
