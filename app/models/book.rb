class Book < ApplicationRecord
  has_many :library_books
  has_many :libraries, through: :library_books
  validates :book_name, presence: true
end
