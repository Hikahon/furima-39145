# DB 設計


## usersテーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_year         | string | null: false               |
| birth_month        | string | null: false               |
| birth_day          | string | null: false               |

### Association
- has_many :items
- has_many :buyers
- has_one :shipping_addresses


## itemsテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| description        | text       | null: false                    |
| category           | string     | null: false                    |
| state              | string     | null: false                    |
| shipping_fee       | string     | null: false                    |
| ship_from          | string     | null: false                    |
| shipping_duration  | string     | null: false                    |
| price              | string     | null: false                    |
| user_id            | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :buyer


## buyersテーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item


## shipping_addressesテーブル
| Column         | Type       | Options                        |
| -------------- | ---------- | -------------------------------|
| postal_code    | string     | null: false                    |
| prefecture     | string     | null: false                    |
| city           | string     | null: false                    |
| street_address | string     | null: false                    |
| building       | string     | null: false                    |
| phone_number   | string     | null: false, unique: true      |
| user_id        | references | null: false, foreign_key: true |

### Association
- belongs_to :user