class Tag < ApplicationRecord
  validates :name, uniqueness: true,
                   presence: true,
                   length: { minimum: 1, maximum: 20 },
                   format: { with: /\A\w?[\.\w\s\-&_]*\w\Z/ }

  has_and_belongs_to_many :functions

  def to_param
    name
  end
end
