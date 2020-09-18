class Book < ApplicationRecord
  belongs_to :user
  default_scope { order(created_at: :asc) }

  validates :title, :author, :pages,
            :category, :progress, presence: true
end
