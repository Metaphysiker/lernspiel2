class PagesController < ApplicationController
  before_action :authenticate_user!, only: :courses
  def welcome

  end

  def about

  end

  def courses

  end
end
