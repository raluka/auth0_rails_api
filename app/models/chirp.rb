# frozen_string_literal: true

class Chirp < ApplicationRecord
  validates_presence_of :body, :published
end
