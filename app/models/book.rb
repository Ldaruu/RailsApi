class Book < ApplicationRecord
  
  validates :title, presence: true
  validates :quote, presence: true

end
