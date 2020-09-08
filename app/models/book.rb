class Book < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true
  validates :pages, presence: true
  validates :category, presence: true
  validates :progress, presence: true
  default_scope { order(created_at: :asc) }
end
