class ReadiesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create
  before_action :set_readie, only: %i[show readme]

  # GET /readies
  # GET /readies.json
  def landing() end

  # GET /readies/1
  # GET /readies/1.json
  def show() end

  # GET /readies/new
  def new() end

  # POST /readies
  # POST /readies.json
  def create
    @readie = Readie.new

    respond_to do |format|
      if @readie.save
        format.json { render @readie, status: :created }
      else
        format.json { render json: @readie.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  def readme
    if request.format.html?
      render :nice_try, status: :ok
    elsif request.format.json?
      @readie.read
      send_data(ActionController::Base.helpers.asset_path('img.png'), type: 'image/png')
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_readie
    token = params[:token]
    if token.blank?
      render :nice_try, status: :ok
      return
    end
    @readie = Readie.find_by(token: token)
  end
end
