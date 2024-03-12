# frozen_string_literal: true

class StaticPagesController < ApplicationController
  before_action :authorized

  def home; end

  def help; end
end
