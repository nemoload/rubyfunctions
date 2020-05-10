class Tag < ApplicationRecord
  validates :name, uniqueness: true,
                   presence: true,
                   length: { minimum: 1, maximum: 20, message: 'Model has wrong characters' },
                   format: { with: /\A[\w_\-]+\z/ }

  has_and_belongs_to_many :functions

  def to_param
    name
  end

  def self.from_param(name)
    find_by(name: name)
  end
end
