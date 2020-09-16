## usersテーブル

| Column                 | Type       | Options     |
| ---------------------- | ---------- | ----------- |
| nickname               | string     | null: false |
| email                  | string     | null: false |
| password               | string     | null: false |
| password_confirmation  | string     | null: false |
| first_name             | string     | null: false |
| last_name              | string     | null: false |
| first_name_kana        | string     | null: false |
| last_name_kana         | string     | null: false |
| birthday               | date       | null: false |

### Association
- has_many :items
- has_many :purchases

## itemsテーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| name                   | string     | null: false                    |
| text                   | text       | null: false                    |
| category_id            | integer    | null: false                    |
| status_id              | integer    | null: false                    |
| shipping_charges_id    | integer    | null: false                    |
| shipping_origin_id     | integer    | null: false                    |
| days_until_shipping_id | integer    | null: false                    |
| price                  | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |

### Association
- has_one :purchase
- belongs_to :user
- has_one_attached :image

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
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| block         | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| purchase      | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase
