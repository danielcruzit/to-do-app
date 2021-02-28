# frozen_string_literal: true

class Task < ApplicationRecord
  # attr_accessor :list_id
  belongs_to :list
  validates :description, presence: true, length: { maximum: 50 }
  validates :completed, inclusion: [true, false]
end
