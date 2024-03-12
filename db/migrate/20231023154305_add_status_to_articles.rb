# frozen_string_literal: true

class AddStatusToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :status, :integer, null: false, default: 0, comment: 'status(0: private, 1: public)'
  end
end
