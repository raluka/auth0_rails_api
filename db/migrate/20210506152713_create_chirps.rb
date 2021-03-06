# frozen_string_literal: true

class CreateChirps < ActiveRecord::Migration[6.0]
  def change
    create_table :chirps do |t|
      t.text :body
      t.boolean :published

      t.timestamps
    end
  end
end
