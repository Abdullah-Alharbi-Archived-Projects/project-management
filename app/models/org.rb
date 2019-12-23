class Org < ApplicationRecord
  belongs_to :user
  has_many :pprojects, dependent: :destroy
end
