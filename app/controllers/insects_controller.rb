class InsectsController < ApplicationController
  before_action :set_insect, only: [:show, :update, :destroy,:destroy_question]

  
  # GET /insects
  def index
    if params[:search].present? && params[:sort].blank?
      @insects = Insect.where("name LIKE ? ",'%' + params[:search] + '%')
    elsif params[:sort].present? && params[:search].blank?
      @insect = Insect.where(hour:params[:sort])
    elsif params[:search].present? && params[:sort].present?
      @insects = Insect.where("name LIKE ? ",'%' + params[:search] + '%')
      @insect = @insect.where(hour:params[:sort])
    else
      @insects = Insect.all
    end
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
    @insect.user_id = params[:user_id]
    now_time = Time.zone.now
    hour = now_time.hour
    if hour >= 3 && hour > 10
      @insect.hour ="早朝"
    elsif hour >= 10 && hour > 17
      @insect.hour ="午前"
    elsif hour >= 17 && hour > 20
      @insect.hour ="午後"
    else
      @insect.hour ="夜"
    end

    if @insect.save
      #params = {
          #id: @customer.id,
          #done: @customer.done,
          #created_at: @customer.created_at,
          #frankfurts: @customer.frankfurts
      #}
      #ActionCable.server.broadcast 'insect_channel', customer: params
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

  def question
    @insect = Insect.where(question: true)
    render json: @insect
  end

  def destroy_question
    @insect.question = false
    if @insect.update(insect_params)
      render json: @insect
    else
      render json: @insect.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_insect
      @insect = Insect.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def insect_params
      params.permit(:name, :description, :latitude, :longitude, :category_id, :date, :prfc, :hour, :pass, :image, :question)
    end
end
