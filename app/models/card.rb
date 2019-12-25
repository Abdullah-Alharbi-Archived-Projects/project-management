class Card < ApplicationRecord
  acts_as_list

  belongs_to :pproject
  has_many :tasks, ->{ order(position: :asc) }, dependent: :destroy

  scope :sorted, ->{ order(position: :asc) }
end
