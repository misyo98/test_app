class Car < ApplicationRecord
  validates :model, :color, length: { in: 3..40 }
  validates :destination, presence: true
end
