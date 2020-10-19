# テーブル設計

## usersテーブル

| Column          | Type   | Options     |
| ---------       | ------ | ----------- |
| email           | string | null: false |
| password        | string | null: false |
| nick_name       | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false | 
| birth-year      | string | null: false |
| birth-month     | string | null: false |
| birth-day       | string | null: false |

### Association

- has_many : items
- has_many : comments


## items テーブル

| Column     | Type      | Options       |
| ---------  | --------  | -----------   |
| image      |           | ActiveStorage |
| item_name  | string    | null: false   |
| category   | string    | null: false   |
| content    | text      | null: false   |
| condition  | string    | null: false   |


### Association

- has_many :comments
- belongs_to :user


## comments テーブル

| Column     | Type      | Options          |
| ---------  | --------  | --------------   |
| text       | text      | null: false      |
| user       | reference |foreign_key: true |
| prototpye  | reference | foreign_key: true|

### Association

- belongs_to :prototpyes
- belongs_to :user

