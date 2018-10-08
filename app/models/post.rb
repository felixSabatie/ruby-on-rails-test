class Post < ApplicationRecord

  validates :name, presence: true
  validates :category_id, presence: true, numericality: {only_integer: true}

  belongs_to :category

end