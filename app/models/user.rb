class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :authentication_keys => [:name]

  attachment :profile_image

  has_many :books, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  def already_favorited(book)
    self.favorites.exists?(book_id: book.id)
  end

  validates :name, presence: true, uniqueness: true, on: :create
  validates :name, length: { minimum: 2, maximum: 20 }
  validates :introduction, length: { maximum: 50 }
end
