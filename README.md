## Usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string｜null: false|
|mail|text|null: false|
|password|integer｜null: false|
|confirmation_password|integer｜null: false|
|first_name|string｜null: false|
|last_name|string｜null: false|
|first_name_kana|string｜null: false|
|last_name_kana|string｜null: false|
|birthday|integer｜null: false|


### Association
- has_many :items
- has_many :items_transaction


## Itemsテーブル

|Column|Type|Options|
|------|----|-------|
|itemname|string|null: false|
|image|string|null: false|
|explanation|text|null: false|
|category|integer|null: false|
|status|integer|null: false|
|postage|integer｜null: false|
|shipping_area|integer|null: false|
|days|integer｜null: false|
|price|integer｜null: false|
|user_id|integer|null: false|foreign_key: true|


### Association
- belongs_to :user
- has_one :item_transaction


## Addressテーブル

|Column|Type|Options|
|------|----|-------|
|postal_code|integer｜null: false|
|prefectures|integer|null: false|
|city|string|null: false|
|address|string|null: false|
|building_name|string|
|tel|integer｜null: false|
|item_transaction_id|integer|foreign_key: true|



### Association
- belongs_to :item_transaction


## ItemTransactionテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|integer|foreign_key: true|
|user_id|integer|foreign_key: true|

### Association
- belongs_to :item
- belongs_to :user
- has_one :adress