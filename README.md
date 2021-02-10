# README
## app name 
Quick Order (仮)

## 概要 / このアプリでできること
- 飲食店などで客がテーブルからアプリを使用して注文・支払いできる
- 飲食店オーナーが、メニュー・テーブル登録できる

## 制作背景 
- コロナの影響で飲食店経営が非接触な方法へ変化している
- 経営者は、新たなタブレット導入や環境整備になど費用をかけている

## 本番環境
1. user/店側

https://quick-order-32005.herokuapp.com/users/sign_in

Login
- メールアドレス: sample@sample.com
- パスワード: a12345

2. buyer/客側

https://quick-order-32005.herokuapp.com/

## 実装内容
1. user/店側
- メニュー管理(メニュー登録、削除、編集 )
- オーダー管理（オーダー・支払い状況確認）
- テーブル管理（登録・削除）
- 支払い管理（請求内容表示、決済の有無確認、決済完了処理）

2. buyer/客側
- テーブル選択/再選択
- メニュー一覧表示
- メニュー詳細表示
- カート管理（登録・表示・削除・個数更新）
- オーダー履歴表示
- 決済機能

## 実装予定
- データベースの変更（MySQLからPostgreSQL）

## フロー
1. user/店側

[![](https://mermaid.ink/img/eyJjb2RlIjoiZ3JhcGggVERcbiAgICBBW-OBiuW6l10gLS0-Qyjjg4jjg4Pjg5fjg5rjg7zjgrgv44Oh44OL44Ol44O8566h55CGKVxuICAgIEMgLS0-IHzjg6Hjg4vjg6Xjg7zpgbjmip58IEQo44Oh44OL44Ol44O857eo6ZuGL-WJiumZpClcbiAgICBELS0-Q1xu44CAXG5cbiAgICBDLS0-fOaWsOODoeODi-ODpeODvOeZu-mMsnwgRijjg6Hjg4vjg6Xjg7znmbvpjLIpXG7jgIAgIEYgLS0-44CAQ1xuXG4gICAgQy0tPnzjgqrjg7zjg4Djg7znrqHnkIZ8IEgo44Kq44O844OA44O85LiA6Kan6KGo56S6KVxu44CAICBIIC0tPuOAgENcbuOAgFxu44CA44CAQyAtLT4gfOODhuODvOODluODq-eZu-mMsnwgSyjjg4bjg7zjg5bjg6vnmbvpjLIv5YmK6ZmkKVxuIOOAgEvjgIAtLT7jgIBDXG5cbuOAgOOAgEMgLS0-IHzlupfpoK3mlK_miZXjgYTmmYLjga7msbrmuIjlh6bnkIZ8IEUo5pSv5omV44GE5Yem55CGKVxu44CA44CARSAtLT585Lya6KiI44OG44O844OW44Or6YG45oqefEco5ZCI6KiI6YeR6aGN6KGo56S6KVxuICAgRyAtLT585bqX6aCt5rG65riIfEko5rG65riI5a6M5LqGKVxuICAgSSAtLT5DXG5cbuOAgCAgXG7jgIAgIiwibWVybWFpZCI6eyJ0aGVtZSI6ImZvcmVzdCJ9LCJ1cGRhdGVFZGl0b3IiOmZhbHNlfQ)](https://mermaid-js.github.io/mermaid-live-editor/#/edit/eyJjb2RlIjoiZ3JhcGggVERcbiAgICBBW-OBiuW6l10gLS0-Qyjjg4jjg4Pjg5fjg5rjg7zjgrgv44Oh44OL44Ol44O8566h55CGKVxuICAgIEMgLS0-IHzjg6Hjg4vjg6Xjg7zpgbjmip58IEQo44Oh44OL44Ol44O857eo6ZuGL-WJiumZpClcbiAgICBELS0-Q1xu44CAXG5cbiAgICBDLS0-fOaWsOODoeODi-ODpeODvOeZu-mMsnwgRijjg6Hjg4vjg6Xjg7znmbvpjLIpXG7jgIAgIEYgLS0-44CAQ1xuXG4gICAgQy0tPnzjgqrjg7zjg4Djg7znrqHnkIZ8IEgo44Kq44O844OA44O85LiA6Kan6KGo56S6KVxu44CAICBIIC0tPuOAgENcbuOAgFxu44CA44CAQyAtLT4gfOODhuODvOODluODq-eZu-mMsnwgSyjjg4bjg7zjg5bjg6vnmbvpjLIv5YmK6ZmkKVxuIOOAgEvjgIAtLT7jgIBDXG5cbuOAgOOAgEMgLS0-IHzlupfpoK3mlK_miZXjgYTmmYLjga7msbrmuIjlh6bnkIZ8IEUo5pSv5omV44GE5Yem55CGKVxu44CA44CARSAtLT585Lya6KiI44OG44O844OW44Or6YG45oqefEco5ZCI6KiI6YeR6aGN6KGo56S6KVxuICAgRyAtLT585bqX6aCt5rG65riIfEko5rG65riI5a6M5LqGKVxuICAgSSAtLT5DXG5cbuOAgCAgXG7jgIAgIiwibWVybWFpZCI6eyJ0aGVtZSI6ImZvcmVzdCJ9LCJ1cGRhdGVFZGl0b3IiOmZhbHNlfQ)

2. buyer/客側

[![](https://mermaid.ink/img/eyJjb2RlIjoiZ3JhcGggVERcbiAgICBBW-OBiuWuouanmF0gLS0-Qyjjg4jjg4Pjg5fjg5rjg7zjgrgv44Oh44OL44Ol44O85LiA6KanKVxuICAgIEMgLS0-IHzjg6Hjg4vjg6Xjg7zpgbjmip58IEQo44Oh44OL44Ol44O86Kmz57SwKVxuICAgIEQtLT585YCL5pWw6YG45oqefExb44Kr44O844OI5L-d5a2YXVxu44CA44CAIEzjgIAtLT7jgIBDXG5cbiAgICBDLS0-fOOCq-ODvOODiOihqOekunwgRijjgqvjg7zjg4jlhoXkuIDopqfooajnpLopXG7jgIAgIEYgLS0-fOWAi-aVsOabtOaWsC_liYrpmaR8IEdb44Kq44O844OA44O856K65a6aXVxuICAgIEfjgIAtLT7jgIBDXG5cbiAgICBDLS0-fOOCquODvOODgOODvOWxpeattHwgSCjjgqrjg7zjg4Djg7zkuIDopqfooajnpLopXG7jgIAgIEggLS0-IHzjgq_jg6zjgrjjg4Pjg4jjgqvjg7zjg4nmlK_miZXjgYR8IEko44Kr44O844OJ5oOF5aCx5YWl5YqbKVxu44CA44CASC0tPnzlupfpoK3mlK_miZXjgYR8IENcbiAgIEktLT5KW-axuua4iF1cbuOAgOOAgErjgIAtLT7jgIBDXG7jgIBcbuOAgOOAgEMgLS0-IHzjg4bjg7zjg5bjg6vpgbjmip4v5YaN6YG45oqefCBLKOODhuODvOODluODq-eZu-mMsilcbiDjgIBL44CALS0-44CAQ1xuXG7jgIAgIFxu44CAICIsIm1lcm1haWQiOnt9LCJ1cGRhdGVFZGl0b3IiOmZhbHNlfQ)](https://mermaid-js.github.io/mermaid-live-editor/#/edit/eyJjb2RlIjoiZ3JhcGggVERcbiAgICBBW-OBiuWuouanmF0gLS0-Qyjjg4jjg4Pjg5fjg5rjg7zjgrgv44Oh44OL44Ol44O85LiA6KanKVxuICAgIEMgLS0-IHzjg6Hjg4vjg6Xjg7zpgbjmip58IEQo44Oh44OL44Ol44O86Kmz57SwKVxuICAgIEQtLT585YCL5pWw6YG45oqefExb44Kr44O844OI5L-d5a2YXVxu44CA44CAIEzjgIAtLT7jgIBDXG5cbiAgICBDLS0-fOOCq-ODvOODiOihqOekunwgRijjgqvjg7zjg4jlhoXkuIDopqfooajnpLopXG7jgIAgIEYgLS0-fOWAi-aVsOabtOaWsC_liYrpmaR8IEdb44Kq44O844OA44O856K65a6aXVxuICAgIEfjgIAtLT7jgIBDXG5cbiAgICBDLS0-fOOCquODvOODgOODvOWxpeattHwgSCjjgqrjg7zjg4Djg7zkuIDopqfooajnpLopXG7jgIAgIEggLS0-IHzjgq_jg6zjgrjjg4Pjg4jjgqvjg7zjg4nmlK_miZXjgYR8IEko44Kr44O844OJ5oOF5aCx5YWl5YqbKVxu44CA44CASC0tPnzlupfpoK3mlK_miZXjgYR8IENcbiAgIEktLT5KW-axuua4iF1cbuOAgOOAgErjgIAtLT7jgIBDXG7jgIBcbuOAgOOAgEMgLS0-IHzjg4bjg7zjg5bjg6vpgbjmip4v5YaN6YG45oqefCBLKOODhuODvOODluODq-eZu-mMsilcbiDjgIBL44CALS0-44CAQ1xuXG7jgIAgIFxu44CAICIsIm1lcm1haWQiOnt9LCJ1cGRhdGVFZGl0b3IiOmZhbHNlfQ)

# テーブル設計

## tableテーブル
| Column             | Type       | Options                         |
| ------------------ | ------     | -------------------------       |
| using              |  boolean   | null: false ,default: true      |

- has_many :orders
- has_many :carts
- belongs_to :purchase


## userテーブル

| Column             | Type       | Options                    |
| ------------------ | ------     | -------------------------- |
| name               | string     | null: false                |
| email              | references | null: false ,unique: true  |
| encrypted_password | references | null: false                |
| phone_number       | string     | null: false                |

### Association
- has_many :items
- has_many :tables


## itemテーブル

| Column          | Type       | Options                         |
| --------------- | ---------- | ------------------------------- |
| user            | references | null: false , foreign_key: true |
| name            | string     | null: false                     |
| description     | text       |                                 |
| genre_id        | integer    | null: false                     |
| cost            | integer    | null: false                     |

### Association

- belongs_to :user
- belongs_to_active_hash :genre
- belongs_to :cart


## cartテーブル

| Column          | Type       | Options                         |
| --------------- | ---------- | ------------------------------- |        
| table           | references | null: false ,foreign_key: true  | 
| item            | references | null: false                     | 
| quantity        | integer	   | null: false ,default: 0         |   
	

### Association 
- has_many :items
- belongs_to :table


## orderテーブル

| Column          | Type       | Options                         |
| --------------- | ---------- | ------------------------------- |
| table           | references | null: false                     |
| item            | references | null: false                     | 
| quantity        | integer	   | null: false, default: 0         |   
| purchase        | references | null: true                      |
| reserved        | boolean    | null: false, default: false      |                |
                        
### Association
- belongs_to :purchase 
- belongs_to :table 
- has_many :items 


## purchases テーブル

| Column         | Type       | Options                        |
| ------         | ---------- | ------------------------------ |
|  table         | references | null: false                    |
|  total_cost    | integer    | null: false                    |
   
### Association
- has_many : orders
- has_one :table

