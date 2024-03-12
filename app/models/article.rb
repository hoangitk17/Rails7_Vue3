# frozen_string_literal: true

class Article < ApplicationRecord
  extend Enumerize

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }

  scope :activated, -> { where status: :public }
  scope :nonactivated, -> { where status: :private }

  enumerize :status, in: {
                       private: 0,
                       public: 1
                     },
                     default: :private,
                     scope: true
end
