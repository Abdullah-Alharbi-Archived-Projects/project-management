class Pproject < ApplicationRecord
  belongs_to :org

  has_many :cards, dependent: :destroy
end
