class PagesController < ApplicationController
  def home
    @apartments = Apartment.all
  end

  def vlad
  end

  def host
    render 'host'
  end
end
