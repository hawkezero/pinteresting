class PinsController < ApplicationController
  before_action :set_pin, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @pins = Pin.all
  end

  def show
  end

  
  def new
    @pin = current_user.pins.build
  end

  
  def edit
  end

  
  def create
    @pin = current_user.pins.build(pin_params)

    
    if @pin.save
      redirect_to @pin, notice: 'Pin was successfully created.' 
    else
      render :new 
    end
  end

  
  def update
    respond_to do |format|
      if @pin.update(pin_params)
        redirect_to @pin, notice: 'Pin was successfully updated.' 
        return
        render :show, status: :ok, location: @pins        
      else
        render :edit
        return 
      end
    end
  end

  
  def destroy
    @pin.destroy
    respond_to do |format|
      redirect_to pins_url, notice: 'Pin was successfully destroyed.'
      return
    end
  end

  private
    
    def set_pin
      @pin = Pin.find(params[:id])
    end

    def correct_user
      @pin = current_user.pins.find_by(id: params[:id])
      redirect_to pins_path if @pin.nil?
    end  
    
    def pin_params
      params.require(:pin).permit(:description, :image)
    end
end
