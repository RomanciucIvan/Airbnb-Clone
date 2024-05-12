class PagesController < ApplicationController
  def home
    @apartments = Apartment.all
  end
end
