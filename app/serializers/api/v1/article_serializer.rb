# frozen_string_literal: true

module Api
  module V1
    class ArticleSerializer < ActiveModel::Serializer
      attributes :id, :title, :body
      attribute :status
      attribute :status_text
    end
  end
end
