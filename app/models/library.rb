class Library < ApplicationRecord
  has_many :library_books
  has_many :books, through: :library_books
  has_many :comments
  belongs_to :user

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :description, presence: true

  def books_attributes=(books_attributes)
    if books_attributes.values[0]["book_name"] != ""
      books_attributes.values.each do |book_attribute|
        book = Book.find_or_create_by(book_attribute)
        self.books << book
      end
    end
  end

  def self.sort_by_rating
    Library.order(rating: :desc)
  end

end
