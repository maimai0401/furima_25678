## Usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string｜null: false|
|first_name|string｜null: false|
|last_name|string｜null: false|
|first_name_kana|string｜null: false|
|last_name_kana|string｜null: false|
|birthday|date｜null: false|


### Association
- has_many :items
- has_many :item_transactions


## Itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|explanation|text|null: false|
|category_id|integer|null: false|
|status_id|integer|null: false|
|postage_id|integer｜null: false|
|prefecture_id|integer|null: false|
|day_id|integer｜null: false|
|price|integer｜null: false|
|user|references|null: false, foreign_key: true|


### Association
- belongs_to :user
- has_one :item_transaction


## Addressesテーブル

|Column|Type|Options|
|------|----|-------|
|postal_code|string｜null: false|
|prefecture_id|integer|null: false|
|city|string|null: false|
|address|string|null: false|
|building_name|string|
|tel|string｜null: false|
|item_transaction|references|null: false,foreign_key: true|



### Association
- belongs_to :item_transaction


## ItemTransactionsテーブル

|Column|Type|Options|
|------|----|-------|
|item|references|null: false, foreign_key: true|
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :item
- belongs_to :user
- has_one :address