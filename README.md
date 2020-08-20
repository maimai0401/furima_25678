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
- has_many :items_transaction


## Itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|explanation|text|null: false|
|category_id|integer|null: false|
|status_id|integer|null: false|
|postage_id|integer｜null: false|
|prefecture_id|integer|null: false|
|days_id|integer｜null: false|
|price|integer｜null: false|
|user_id|integer|null: false|foreign_key: true|


### Association
- belongs_to :user
- has_one :item_transactions


## Addressesテーブル

|Column|Type|Options|
|------|----|-------|
|postal_code|string｜null: false|
|prefecture_id|integer|null: false|
|city|string|null: false|
|address|string|null: false|
|building_name|string|
|tel|string｜null: false|
|item_transaction_id|integer|foreign_key: true|



### Association
- belongs_to :item_transaction


## ItemTransactionsテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item
- belongs_to :user
- has_one :address