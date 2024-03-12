# frozen_string_literal: true

module Api
  module V1
    class CommentsController < ApplicationController
      def show
        render html: helpers.tag.strong('Not Found')
      end
    end
  end
end
