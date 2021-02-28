# frozen_string_literal: true

class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :description
      t.boolean :completed, default: false
      t.references :list
      t.timestamps
    end
  end
end
