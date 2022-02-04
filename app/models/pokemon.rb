class Pokemon < ApplicationRecord
  validates :hp, presence: true
  validates :name, uniqueness: true
end
