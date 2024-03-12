# frozen_string_literal: true

module Api
  module V1
    class ArticlesController < ApplicationController
      def index
        render json: Article.all.activated, each_serializer: Api::V1::ArticleSerializer, meta: { name: 'hoang' }
      end

      def show
        render json: Article.find(1), serializer: Api::V1::ArticleSerializer
      end
    end
  end
end
