# frozen_string_literal: true

class CreateListOfTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :list_of_tasks do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
