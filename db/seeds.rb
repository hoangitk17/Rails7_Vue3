# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require_relative './article_seeding'

Rails.logger.debug 'Seeding...'

Article.destroy_all
5.times do
  puts(FactoryBot.create(:article))
end

seed_articles

Rails.logger.debug "Created #{Article.count} Article"

Rails.logger.debug 'Seeding done.'
