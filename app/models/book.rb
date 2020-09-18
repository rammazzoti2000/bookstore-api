class Book < ApplicationRecord
  default_scope { order(created_at: :asc) }
  validates :title, :author, :pages,
            :category, :progress, presence: true
end
