# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :list, dependent: :destroy
  validates :description, presence: true, length: { maximum: 50 }
  validates :completed, presence: true
end
