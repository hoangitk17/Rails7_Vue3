# frozen_string_literal: true

require 'csv'

def seed_articles
  csv_file_path = Rails.root.join('db/data/csv/articles.csv')
  Rails.logger.debug "Seeding article from #{csv_file_path}..."
  f = File.new(csv_file_path, 'r')
  csv = CSV.new(f)
  csv.shift

  csv.each do |row|
    article_params = {
      title: row[0],
      body: row[1]
    }
    Article.create!(article_params)
  end
  Rails.logger.debug "Seeding article from #{csv_file_path} done."
end
