# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# Pictweet DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|name|string|null: false|
|image_name|string|null: false|
### Association
- has_many :likes
- has_many :comments
- has_many :guides, through: :user_guides
- has_many :user_guides

## guidesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string||
|body|text||
|title|string||
### Association
- has_many :users, through: :user_guides
- has_many :user_guides
- has_many :comments
- has_many :likes

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|tweet_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :guide
- belongs_to :user

## user_guidesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|guide_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :guide
- belongs_to :user

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|guide_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :guide
- belongs_to :user