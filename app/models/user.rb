class User < ApplicationRecord
  
  before_save :set_slug
  
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_movies, through: :favorites, source: :movie
  
  has_secure_password
  
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :email, format: { with: /\S+@\S+/ }, 
                    uniqueness: { case_sensitive: false }
                    
  def to_param
    slug
  end
                    
private
  def set_slug
    self.slug = name.parameterize
  end
end
