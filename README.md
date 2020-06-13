![Geo-app](7e483251f01d80ac5c33bbe074341d69.gif)

<h2 align="center">Travel Geographic</h2>

# 概要
**日本の美しい自然景観や文化景観の「なぜ？」を紐解き、旅先が好きになる・誇りに思えるデジタルガイドサービス**です。ユーザーは、気になるガイドを検索し、購入することができます。

# 本番環境
## 🌐 デプロイ先(S3との連携を行っておらず、画像は表示されません)
https://travelgeographic.herokuapp.com/

## :memo:テストアカウント
**Email**: taro75@gmail.com  
**Password**: NYN0rsnD

# 制作背景(意図)
**現在の文化歴史観光の課題は、旅先の土地に関する情報を得にくい**ことです。そのように思ったきっかけは、私が学生時代に旅をしていたときに、いざ旅先の歴史や文化を知ろうと思っても、案内板が難しい、もしくはそもそもなくて、結局インスタ映えする写真だけ撮って帰ってしまったという経験です。歴史は、音楽やスポーツと同じように勇気や感動を与えてくれるものであるのに、それが十分に人々に伝わっていないと感じました。そこで、地理学者や歴史学者のヒアリングを元に、旅先の文化歴史の成り立ちを届けることで、旅先のことがさらに好きになり、そこで生きた人々の想いが人生を前向きにする新たな道標となってくれるのではないかと考えました。

# DEMO

### 1. トップページからログイン

![Geo-app](fafb49f70f9e7f43b5ccdb7b95a16851.gif)

### 2. ガイドを探す
#### 2-1. インクリメンタルサーチ

![Geo-app]()

#### 2-2. 日本地図

3.　負の遺産へのレビューを行う

![Mirai-app](https://i.gyazo.com/fedeeba42e1a31c36b52063154e4e8b1.gif)

（4. ユーザー自ら遺産の追加も可能）

![Mirai-app](https://i.gyazo.com/35ebf5050ef81da56919b575e68ccd4c.png)

# 工夫したポイント
- ローディングアニメーションを実装し、ユーザーにインパクトのあるUIを心がけました。
- 検索には、曖昧検索かつ非同期通信を採用し、ユーザーの使いやすさを重視しました。
- ユーザー自身も自由に負の遺産を投稿できることで、世間から認知されていない場所が改めて認知される機会を作りました。
- レビュー機能を追加し、当事者が当時の記憶を書き残し、また旅行者も感想を書き残せることで、「記憶継承の文化をみんなで作り上げていくサービス」ということを意識しました。

# 使用技術(開発環境)
Ruby/Ruby on Rails/MySQL/Github/heroku/Visual Studio Code

# 課題や今後実装したい機能
<dl>
  <dt>本番環境で画像が表示されない</dt>
  <dd>S3のストレージと連携させることで、heroku特有のデータベースリセットを回避する</dd>
  <dt>ボランティアガイドの申し込みの手続きが複雑かつ認知されていない</dt>
  <dd>施設の公式アカウントを作成し、ボランティアガイドとユーザーのマッチング機能を実装する</dd>
  <dt>検索方法を増やす</dt>
  <dd>ジャンルテーブルを作成し、ジャンルでユーザーが検索できるようにする</dd>
  <dt>ログイン方法を増やす</dt>
  <dd>APIを用いて、手軽なSNSログインを実装することで、ユーザーの利用率をあげる</dd>
  <dt>遺産の場所が一目でわからない</dt>
  <dd>GoogleMapのAPIを実装し、遺産の場所がすぐにわかるようにしたい</dd>
</dl>
  


# DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|image|string|null: false|
|email|string|null: false|
|password|string|null: false|

### Association
- has_many :likes
- has_many :comments
- has_many :guides, through: :user_guides
- has_many :user_guides

## guidesテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|-------|
|image|string|-------|
|body|text|-------|
|price|integer|-------|
|area|string|-------|

### Association
- has_many :users, through: :user_guides
- has_many :user_guides
- has_many :comments
- has_many :likes
- has_many :pictures

## picturesテーブル
|Column|Type|Options|
|------|----|-------|
|picture|string|-------|
|guide|reference|null: false, foreign_key: true|

### Association
- belongs_to :guide

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|guide_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :guide
- belongs_to :user

## user_guidesテーブル
|Column|Type|Options|
|------|----|-------|
|user|reference|foreign_key: true|
|guide|reference|foreign_key: true|
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
