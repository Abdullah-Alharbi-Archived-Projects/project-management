class Task < ApplicationRecord
  acts_as_list scope: :card

  belongs_to :card
end
