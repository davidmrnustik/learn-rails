class VisitorsController < ApplicationController
  
  def new
    @owner = Owner.new
    # This is what's happened in Rails code library
    # render 'visitors/new'
    
    # Render without any application layout
    # render 'visitors/new', layout: false 
    
    # Render with specify alternative layout
    # render 'visitors/new', layout: 'special'
    
    flash.now[:notice] = 'Welcome!'
    flash.now[:alert] = 'My birthday is soon.'
  end
  
end