# テーブル設計

## users テーブル

|  Column             |  Type   |  Option                      |
| ------------------- | -------- | --------------------------- |
|  name               |  string  |  null: false                | 
|  company_name       |  string  |                             | 
|  email              |  string  |  null: false, unique: true  |
|  encrypted_password |  string  |  null: false                |
|  post_code          |  string  |  null:false                 |
|  prefecture_id      |  integer |  null:false                 |
|  city               |  string  |  null:false                 |
|  house_number       |  string  |  null:false                 |
|  building_name      |  string  |  null:false                 |
|  tell_number        |  string  |  null:false                 |
|  birthday           |  date    |  null: false                |

### Association

- has_many :jobs
- has_many :room_users

## job テーブル
|  Column            |  Type        |  Option                         |
| ------------------ | ------------ | ------------------------------- |
|  order_title       |  string      |  null: false                    |
|  order_detail      |  text        |  null: false                    |
|  period            |  string      |  null: false                    |
|  order_price       |  string      |  null: false                    |
|  category_id       |  integer     |  null: false                    |
|  job_post_code     |  string      |  null:false                     |
|  job_prefecture_id |  integer     |  null:false                     |
|  job_city          |  string      |  null:false                     |
|  job_house_number  |  string      |                                 |
|  building_name     |  string      |                                 |
|  user              |  references  |  null: false, foreign_key: true |
|  room              |  references  |  null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :rooms

# room_user テーブル
|  Column            |  Type        |  Option                         |
| ------------------ | ------------ | ------------------------------- |
|  user              |  references  |  null: false, foreign_key: true |
|  room              |  references  |  null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :room

## room テーブル

|  Column            |  Type        |  Option                         |
| ------------------ | ------------ | ------------------------------- |
|  rooms_name        |  string      |  null: false                    |
|  job               |  references  |  null: false, foreign_key: true |

### Association

- has_many :room_users
- belongs_to :job
- has_many :messages

## messages テーブル

|  Column            |  Type        |  Option                         |
| ------------------ | ------------ | ------------------------------- |
|  content           |  string      |  null: false                    |
|  user              |  references  |  null: false, foreign_key: true |
|  room              |  references  |  null: false, foreign_key: true |

### Association 

- belongs_to :room