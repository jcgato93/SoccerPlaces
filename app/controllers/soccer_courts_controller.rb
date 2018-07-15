class SoccerCourtsController < ApplicationController
  before_action :set_soccer_court, only: [:show, :edit, :update, :destroy]

  # GET /soccer_courts
  # GET /soccer_courts.json
  def index
    @soccer_courts = SoccerCourt.all
  end

  # GET /soccer_courts/1
  # GET /soccer_courts/1.json
  def show
  end

  # GET /soccer_courts/new
  def new
    @soccer_court = SoccerCourt.new
  end

  # GET /soccer_courts/1/edit
  def edit
  end

  # POST /soccer_courts
  # POST /soccer_courts.json
  def create
    @soccer_court = SoccerCourt.new(soccer_court_params)

    respond_to do |format|
      if @soccer_court.save
        format.html { redirect_to @soccer_court, notice: 'Soccer court was successfully created.' }
        format.json { render :show, status: :created, location: @soccer_court }
      else
        format.html { render :new }
        format.json { render json: @soccer_court.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /soccer_courts/1
  # PATCH/PUT /soccer_courts/1.json
  def update
    respond_to do |format|
      if @soccer_court.update(soccer_court_params)
        format.html { redirect_to @soccer_court, notice: 'Soccer court was successfully updated.' }
        format.json { render :show, status: :ok, location: @soccer_court }
      else
        format.html { render :edit }
        format.json { render json: @soccer_court.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /soccer_courts/1
  # DELETE /soccer_courts/1.json
  def destroy
    @soccer_court.destroy
    respond_to do |format|
      format.html { redirect_to soccer_courts_url, notice: 'Soccer court was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_soccer_court
      @soccer_court = SoccerCourt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def soccer_court_params
      params.require(:soccer_court).permit(:name, :location, :price, :isActive)
    end
end
