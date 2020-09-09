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
| item_name            | string     | null: false                    |
| item_text            | text       | null: false                    |
| item_image           | text       | null: false                    |
| category             | integer    | null: false                    |
| status               | integer    | null: false                    |
| shipping_charges     | integer    | null: false                    |
| shipping_origin      | integer    | null: false                    |
| days_until_shipping  | integer    | null: false                    |
| price                | integer    | null: false                    |
| user_id              | references | null: false, foreign_key: true |

### Association
- has_one :purchase
- belongs_to :user

## purchasesテーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user_id  | references | null: false, foreign_key: true |
| item_id  | references | null: false, foreign_key: true |

### Association
- has_one :orders
- has_one :credit_information
- belongs_to :user
- belongs_to :item

## shipping_addressesテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code     | integer    | null: false                    |
| prefecture    | integer    | null: false                    |
| city          | string     | null: false                    |
| block         | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| user_id       | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase

## ordersテーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| price    | integer    | null: false                    |
| user_id  | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase