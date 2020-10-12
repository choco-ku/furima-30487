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
| birthday        | date     | null: false |


### Association

- has_many :items
- has_many :comments
- has_many :purchases


## items テーブル

| Column         | Type      | Options       |
| ---------      | --------  | -----------   |
| name           | string    | null: false   |
| content        |  text     | null: false   |
| category_id    |  integer  | active_hash   |
| condition_id   |  integer  | active_hash   |
| shipping_fee_id|  integer  | active_hash   |
| shipping_place_id |  integer  | active_hash   |
| shipping_date_id  |  integer  | active_hash   |
| price          | integer   | null: false   |
| user           | references| foreign_key: true, null: false|

### Association

- has_many :comments
- belongs_to :user
- has_one :purchase


## comments テーブル

| Column     | Type      | Options           |
| ---------  | --------  | --------------    |
| text       | text      | null: false       |
| user       | references | foreign_key: true, null: false |
| item       | references | foreign_key: true, null: false |

### Association

- belongs_to :item
- belongs_to :user


## purchase テーブル

| Column     | Type      | Options           |
| ---------  | --------  | --------------    |
| user       | references | foreign_key: true, null: false |
| item       | references | foreign_key: true, null: false |


### Association

- has_one :address
- belongs_to  :user
- belongs_to  :item


## address テーブル

| Column         | Type      | Options       |
| ---------      | --------  | -----------   |
| post_code      |  string   | null: false   |
| prefecture_id  |  integer  | null: false   |
| city           |  string   | null: false   |
| house_num      |  string   | null: false   |
| building       |  string   |               |
| telephone      | string    | null: false   |
| purchase       | references| foreign_key: true, null: false |

### Association

- belongs_to  :purchase
