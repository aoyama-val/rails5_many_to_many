class User < ApplicationRecord
  # dependent: :destroy をつけておくと、Userを削除したとき関連するGroupUserも削除される
  has_many :group_users, dependent: :destroy
  # -> { distinct } をつけておくと、DBに重複するレコードがあっても1個しか出てこない。
  # https://railsguides.jp/association_basics.html
  has_many :groups, -> { distinct }, through: :group_users
end
