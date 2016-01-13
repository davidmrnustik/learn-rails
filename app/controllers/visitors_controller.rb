class VisitorsController < ApplicationController
  
  def new
    @visitor = Visitor.new
    # This is what's happened in Rails code library
    # render 'visitors/new'
    
    # Render without any application layout
    # render 'visitors/new', layout: false 
    
    # Render with specify alternative layout
    # render 'visitors/new', layout: 'special'
    
  end
  
  def create
    @visitor = Visitor.new(secure_params)
    if @visitor.valid?
      @visitor.subscribe
      flash[:notice] = "Signed up #{@visitor.email}."
      redirect_to root_path
    else
      render :new
    end
  end
  
  private
  
  def secure_params
    params.require(:visitor).permit(:email)
  end
  
end