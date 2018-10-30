class SoccerCourtsController < ApplicationController
  before_action :set_soccer_court, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :authenticate_admin!, only: [:destroy]
  layout "reservas"
  # GET /soccer_courts
  # GET /soccer_courts.json
  # Retorna la vista de index junto con el listado de Canchas
  def index
    @soccer_courts = SoccerCourt.all
  end

  # GET /soccer_courts/1
  # GET /soccer_courts/1.json
  # Retorna la vista Show
  def show
  end

  # GET /soccer_courts/new
  # Retorna la vista de new para crear una nueva cancha
  def new
    @soccer_court = SoccerCourt.new
  end

  # GET /soccer_courts/1/edit
  # Retorna la vista edit para editar una cancha
  def edit
  end

  # POST /soccer_courts
  # POST /soccer_courts.json
  # Crea una cancha
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
  # Actualiza una cancha
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
  # Borra una cancha
  def destroy
    @soccer_court.destroy
    respond_to do |format|
      format.html { redirect_to soccer_courts_url, notice: 'Soccer court was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Retornar las vista index junto con todos los registros de las reservas
    def set_soccer_court
      @soccer_court = SoccerCourt.find(params[:id])
    end

    # Especifica los parametros permitidos en las peticiones
    def soccer_court_params
      params.require(:soccer_court).permit(:name, :location, :price, :isActive)
    end
end
