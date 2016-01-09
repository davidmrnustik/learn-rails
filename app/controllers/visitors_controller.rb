class VisitorsController < ApplicationController
  
  def new
    @owner = Owner.new
    # render 'visitors/new' # this is what's happened in Rails code library
  end
  
end