class Quote < ApplicationRecord
  include ActiveModel::Validations

  validates :saying, presence: true, length: { in: 3..240 }
  validates :author, presence: true, length: { in: 3..50 }
  validates_with ProfanityValidator
end
