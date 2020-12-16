# README
## app name 
Quick Order (仮)

## 概要 / このアプリでできること
- 飲食店などで客がテーブルから自分でアプリ注文・支払いできる
- 飲食店オーナーが、メニュー・テーブル登録できる

## 制作背景 
- コロナの影響で飲食店経営の方法が人的非接触変化している
- 経営者は、新たなタブレット導入や環境整備になど費用をかけている

## DEMO 

## 実装内容の予定
1. admin user/ seller
- メニュー管理(メニュー登録、削除 )
- オーダー管理（オーダー・支払い状況確認）
- テーブル登録
- 支払い管理（請求内容表示、決済の有無確認、決済完了処理）

2. buyer
- メニュー一覧表示
- メニュー詳細表示
- カート管理（カート登録・メニュー表示・削除・個数更新）
- 決済

# テーブル設計

## tableテーブル
| Column             | Type       | Options                         |
| ------------------ | ------     | -------------------------       |
| using              |  boolean   | null: false ,default: true      |

- has_many :orders
- has_many :carts
- has_one :purchase


## admin userテーブル

| Column             | Type       | Options                         |
| ------------------ | ------     | -------------------------       |
| name               | string     | null: false                     |
| email              | references | null: false , foreign_key: true |
| encrypted_password | references | null: false , foreign_key: true |
| phone_number       | string     | null: false                     |

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
| table           | references | null: false, foreign_key:true   |
| item            | references | null: false                     | 
| quantity        | integer	   | null: false, default: 0         |   
| purchase        | references | null: true                      |
                        
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

