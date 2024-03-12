# frozen_string_literal: true

class Micropost < ApplicationRecord
  validates :content, length: { maximum: 140 }, presence: true
end
