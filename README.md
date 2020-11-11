## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|mail|string|null: false, unique: true|
|password|string|null: false|

### Association
has_many :notes
has_many :comments
has_many :favorites

## notesテーブル

|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|user_id|integer|null: false, foreign_key: true|
|status|string|null: false|
|subject|string|null: false|
|text|text|null: false|

### Association
belongs_to :user
has_many :images
has_many :comments
has_many :favorites

### imageテーブル

|Column|Type|Options|
|------|----|-------|
|src|string||
|note_id|integer|null: false|

### Association
belongs_to :note

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|comment|text|null:false|
|user_id|integer|null:false,foreign_key:true|
|note_id|integer|null:false,foreign_key:true|

### Association
belongs_to :user
belongs_to :note

## favoritesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null:false,foreign_key:true|
|note_id|integer|null:false,foreign_key:true|

### Association
belongs_to :user
belongs_to :note