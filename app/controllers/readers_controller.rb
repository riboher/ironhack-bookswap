class ReadersController < ApplicationController
  before_action :authenticate_reader!
  def show
  end

  def update
    respond_to do |format|
      if current_reader.update(reader_params)
        format.html { redirect_to reader_path , notice: "Your info was succesfully updated" }
      else
        format.html { redirect_to reader_path , notice: "Something went wrong. It wasn't possible to update your info"}
      end
    end
  end

  private
  def reader_params
    params.require(:reader).permit(:first_name, :last_name, :email, :address, :postcode, :city)
  end
end
