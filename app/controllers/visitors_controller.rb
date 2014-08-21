class VisitorsController < ApplicationController

  def new
    @visitor = Visitor.new
  end

  def create
    @visitor = Visitor.new(secure_params)
    if @visitor.valid?
      @visitor.update_spreadsheet
      flash.now[:notice] = "Chose #{@visitor.favourite}."
      redirect_to root_url
    else
      render :new
    end
  end

  private

  def secure_params
    params.require(:visitor).permit(:favourite, :comment)
  end

end
