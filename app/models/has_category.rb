class HasCategory < ApplicationRecord
  belongs_to :article
  belongs_to :category
  has_many :has_categories
end
