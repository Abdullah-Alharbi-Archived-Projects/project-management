class Card < ApplicationRecord
  belongs_to :pproject
  has_many :tasks, dependent: :destroy
end
