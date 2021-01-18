アプリ名： LeanRecruitment
 ----------------------------------------
 人材不足に悩む人へのアプリケーションです。


概要
 ----------------------------------------
 建築業や電気工事業で人材不足に悩んでいる人。
 こんな技術を持っているけど働く環境がないという人が繋がることができます。
 電話で何人にも仕事のお願いをする手間を省くことができ、新たな仕事仲間を見つけることができ仕事の幅が広がります。

作成背景
 ----------------------------------------
 地方銀行に勤めているときに、建設業を個人でされているかたがいて、私と話をしている時だけでも何回も仕事の電話がかかってきていました。複数人に電話をかけることは手間がかかるし、記録が残らないから仕事内容がうまく伝わらない可能性があるなと感じました。また、そのかたは特赦な技術を持っていたため関東や名古屋辺りにも行かなければならなかった。そんなときに、現地で仕事を一緒にできる人を探せたり、記録が残る募集方法があれば便利かなと思いこのアプリケーションを作成しました。

利用方法
 ----------------------------------------
 ・トップページで取り組みたい仕事がある、または募集をかけたい場合は、新規登録・ログインを行う

 ・新規投稿は、右上の投稿ボタンをクリック

 ・投稿完了後は一覧画面に戻る

 ・取り組みたい仕事があれば、一覧表示のタイトルをクリックし詳細画面へ

 ・詳細画面の内容でいいまたは、質問があればチャットをクリックし投稿者へ質問する

工夫したポイント
 ----------------------------------------
 ・中間テーブルを使ってチャット機能を作成したところ
 ・kaminairを使って投稿数に応じてページを変更できること
 ・AWSの自動デプロイ機能


課題解決
 ----------------------------------------

|ユーザーストーリーから考える課題                               |    課題解決                                                                  |
| ---------------------------------------------------------------|--------------------------------------------------------------------- |
| 技術を持った人が見つからない・遠方での仕事で知り合いがいない  | 募集機能で〇〇を持った人を募集                                                |
|知り合いばかりに仕事を依頼して申し訳ない・毎回電話するのが手間 | 予め募集をかけることで仕事の計画が建てやすい、募集し選ぶだけだから手間が少ない|
|電話で約束したら記録が残らないから申告の時大変                  | チャットや募集時の契約で金額がわかるから申告の時も楽                        |


機能一覧
 --------------------------------------------------------------------

 | 機能                  |  概要                                     |
 |---------------------- | ----------------------------------------- |
 |ユーザー管理機能       |  新規投稿・ログイン・ログアウト           |
 | 投稿機能              |  どのような募集をするのか詳細に記述できる | 
 | 投稿詳細表示機能      |  各投稿詳細が詳細ページで閲覧可能         | 
 | 投稿編集・削除機能    | 投稿者本人のみ投稿編集・削除が可能        | 
 |チャット機能           | 投稿者などと詳しい話ができる              | 

課題や今後実装したい機能
 --------------------------------------------------------------------
 |HTML,CSSを整えてもっとスマートな見た目のアプリケーションにしたい   |
 |カテゴリーや仕事名で検索できる機能                                 |
 |Dockerの追加                                                       |
 |仕事が気になるボタンを作成する                                     |
 |チャット機能をもっと使いやすくする                                 |


# テーブル設計

## users テーブル

|  Column             |  Type   |  Option                      |
| ------------------- | -------- | --------------------------- |
|  name               |  string  |  null: false                | 
|  company_name       |  string  |                             | 
|  age                |  integer |  nill: false                |
|  email              |  string  |  null: false, unique: true  |
|  encrypted_password |  string  |  null: false                |
|  tell_number        |  string  |  null: false                |
|  birthday           |  date    |  null: false                |

### Association

- has_many :jobs
- has_many :room_users
- has_one :address
- has_many :messages
- has_many :rooms, through: :room_users

## address テーブル
|  Column             |  Type   |  Option                      |
| ------------------- | -------- | --------------------------- |
|  post_code          |  string  |  null: false                |
|  prefecture_id      |  integer |  null: false                |
|  city               |  string  |  null: false                |
|  house_number       |  string  |  null: false                |
|  building_name      |  string  |                             |

- belongs_to :user



## job テーブル
|  Column            |  Type        |  Option                         |
| ------------------ | ------------ | ------------------------------- |
|  order_title       |  string      |  null: false                    |
|  order_detail      |  text        |  null: false                    |
|  period            |  string      |  null: false                    |
|  order_price       |  string      |  null: false                    |
|  category_id       |  integer     |  null: false                    |
|  job_post_code     |  string      |  null:false                     |
|  prefecture_id     |  integer     |  null:false                     |
|  job_city          |  string      |  null:false                     |
|  job_house_number  |  string      |                                 |
|  building_name     |  string      |                                 |
|  user              |  references  |  null: false, foreign_key: true |
|  room              |  references  |  null: false, foreign_key: true |

### Association

- belongs_to :user

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
- has_many :users, through: :room_users

## messages テーブル

|  Column            |  Type        |  Option                         |
| ------------------ | ------------ | ------------------------------- |
|  content           |  string      |  null: false                    |
|  user              |  references  |  null: false, foreign_key: true |
|  room              |  references  |  null: false, foreign_key: true |

### Association 

- belongs_to :room
- belongs_to :user