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
| birth_year      | string   | null: false |
| birth-month     | string   | null: false |
| birth-date      | string   | null: false |

### Association

- has_many :items
- has_many :comments
- has_one :purchase


## items テーブル

| Column         | Type      | Options       |
| ---------      | --------  | -----------   |
| image          |           | ActiveStorage |
| name           | string    | null: false   |
| content        |  text     | null: false   |
| category       |  integer  | active_hash   |
| condition      |  integer  | active_hash   |
| shipping_fee   |  integer  | active_hash   |
| shipping_place |  integer  | active_hash   |
| shipping_date  |  integer  | active_hash   |
| price          | integer   | null: false   |
| user           | reference | foreign_key: true|

### Association

- has_many :comments
- belongs_to :user
- has_one :purchase


## comments テーブル

| Column     | Type      | Options           |
| ---------  | --------  | --------------    |
| text       | text      | null: false       |
| user       | reference | foreign_key: true |
| item       | reference | foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user


## purchase テーブル

| Column     | Type      | Options           |
| ---------  | --------  | --------------    |
| user       | reference | foreign_key: true |
| item       | reference | foreign_key: true |


### Association

- has-one :address
- belongs_to  :user
- belongs_to  :item


## address テーブル

| Column         | Type      | Options       |
| ---------      | --------  | -----------   |
| post_code      |  string   | null: false   |
| prefecture     |  intege   | null: false   |
| city           |  string   | null: false   |
| house_num      |  string   | null: false   |
| building       |  string   | active_hash   |
| telephone      | string    | null: false   |

### Association

- belongs_to  :purchase
