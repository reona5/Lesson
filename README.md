# Lesson

オフライン上で気軽に授業の場を提供するサービスです。
URL:https://lesson-code.herokuapp.com/

# 主な機能

- ユーザ管理機能（devise,twitter-omniauth）
  - 新規登録
  - 詳細表示
  - ユーザ編集
  - ユーザ退会
  - ログイン・ログアウト
  - メール配信によるアカウント有効化
  - メール配信による編集情報有効化
  - メール配信によるパスワード再設定
  - Twitter連携
  - プロフィール画像のアップロード機能（carrierwave,S3へのアップロード）
  - Remember Me
- 投稿管理機能
  - 新規登録
  - 一覧表示（kaminariによるページネーション機能）
  - 詳細表示
  - 投稿編集
  - 投稿削除
- コメント機能（counter_culture）（ajax化）
  - コメント登録
  - コメント削除
- いいね機能（counter_culture）（ajax化）
  - いいね登録
  - いいね削除
- タグ機能（acts-as-taggable-on）
  - 投稿に対するタグ関連付け
  - タグによる投稿検索（ransack）

- RSpec
  - System Spec
  - Model Spec

- Views
  - Bootstrap（4.3.1）
  - Slim（4.0.1）

- Ruby（2.6.2）
- Rails（5.2.3）