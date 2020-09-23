require_relative 'concerns/hour'

class InsectsController < ApplicationController
  before_action :set_insect, only: [:show, :update, :destroy]

  
  # GET /insects
  def index
    @insects = Insect.all
    @insects = @insects.where('name LIKE ?',"%#{params[:name]}%")
    render json: @insects
  end

  # GET /insects/1
  def show
    @comments = Comment.where(insect_id: params[:id])
    respond_to do |format|
      format.json  { render :json => {:insect => @insect, 
                                      :comments => @comments }}
    end
  end

  # POST /insects
  def create
    @insect = Insect.new(insect_params)
    @insect.hour = create_hour

    if @insect.save
      render json: @insect, status: :created, location: @insect
    else
      render json: @insect.errors, status: :unprocessable_entit
    end
  end

  # PATCH/PUT /insects/1
  def update
    if @insect.update(insect_params)
      render json: @insect
    else
      render json: @insect.errors, status: :unprocessable_entity
    end
  end

  # DELETE /insects/1
  def destroy
    if Comment.where(insect_id: params[:id])
      Comment.where(insect_id: params[:id]).destroy_all
    end
    @insect.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_insect
      @insect = Insect.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def insect_params
      params.permit(:name, :desription, :latitude, :longitude, :category_id, :date, :prfc, :hour, :image)
    end
end
