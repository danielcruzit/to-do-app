# frozen_string_literal: true

class List < ApplicationRecord
  has_many :tasks
  validates :name, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 250 }
end
