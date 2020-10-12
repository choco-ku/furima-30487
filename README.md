# テーブル設計

## usersテーブル

| Column          | Type   | Options     |
| ---------       | ------ | ----------- |
| email           | string | null: false |
| password        | string | null: false |
| nickname        | string   | null: false |
| first_name      | string   | null: false |
| last_name       | string   | null: false |
| last_name_kana  | string   | null: false |
| first_name_kana | string   | null: false |

### Association

- has_many :items
- has_many :comments


## items テーブル

| Column         | Type      | Options       |
| ---------      | --------  | -----------   |
| image          |           | ActiveStorage |
| item_name      | string    | null: false   |
| content        |  text     | null: false   |
| category       |  string   | ActiveStorage |
| condition      |  string   | null: false   |
| shipping_fee   | string    | null: false   |
| shipping_place | string    | null: false   |
| price          | sting     | null: false   |
| user           | reference | foreign_key: true|

### Association

- has_many :comments
- belongs_to :user


## comments テーブル

| Column     | Type      | Options          |
| ---------  | --------  | --------------   |
| text       | text      | null: false      |
| user       | reference |foreign_key: true |
| item       | reference | foreign_key: true|

### Association

- belongs_to :item
- belongs_to :user


## customers テーブル

| Column     | Type      | Options          |
| ---------  | --------  | --------------   |
| credit_num | string    | null: false      |
| expire     | string    | null: false      |
| code       | string    | null: false      |

### Association

- has-one :address


## address テーブル

| Column         | Type      | Options       |
| ---------      | --------  | -----------   |
| post_code      |  string   | null: false   |
| prefecture     |  string   | null: false   |
| city           |  string   | null: false   |
| house_num      |  string   | null: false   |
| building       |  string   |               |
| telephone      | string    | null: false   |

### Association

- belongs_to  :customer
