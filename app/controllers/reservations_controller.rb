class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroys]
  before_action :authenticate_user!, except: [:getreservations]
  
  before_action :authenticate_admin!, only: [:destroy]
  layout "reservas"




  # GET /reservations
  # GET /reservations.json
  # Retornar las vista index junto con todos los registros de las reservas
  def index
    @reservations = Reservation.all
    # @test= SoccerCourt.includes(:reservation).find(params[:soccer_court_id])
    byebug
     @soccer_court_id= params[:soccer_court_id]
  end

  # GET /reservations/getReservations/get
  # Retorna las reservas pertenecientes a una cancha y fecha especificadas
  def getreservations
    byebug
    soccer_court_id= params[:id].to_i
    date=params[:date]
    byebug
    @reservations= Reservation.where(soccer_court_id: soccer_court_id, isActive: true, dateOfReservation: date)
    render json: @reservations
  end

  # POST /reservations/getReservations/misReservas
  # Retorna la vista de las reservas activas de un usuario
  def getMisReservas

    test =  SoccerCourt.joins(:reservation).where(reservations: {user_id: 1}).select('*');
    @reservationsOfUser =test
    byebug
    # render "MisReservas"       
  end

  # GET /reservations/1
  # GET /reservations/1.json
  # Retorna la vista show
  def show
  end

  # GET /reservations/new
  # Muestra la vista para registrar una reserva
  def new
    @reservation = Reservation.new
    @soccer_court_id = params[:soccer_court_id]
    date=params[:date]
    
    @reservations= Reservation.where(soccer_court_id: @soccer_court_id, isActive: true, dateOfReservation: date)
   
  end

  # GET /reservations/1/edit
  # Retorna la vista de edit
  def edit
  end

  # POST /reservations
  # POST /reservations.json
  # Registra una nueva reserva y envia un correo
  # de notificacion al usuario
  def create
    @reservation = Reservation.new(reservation_params)
    
    # @reservation.timeOfReservation=@reservation.timeOfReservation.strftime('%H')
    byebug
    respond_to do |format|
      if @reservation.save
        @reservation= Reservation.last
        #Envio de correo , registro exitoso
        NotifyMailer.send_mail(current_user.email,'Registro de reserva',@reservation).deliver
        
        format.html { redirect_to @reservation, notice: 'Reservation was successfully created.' }
        format.json { render :show, status: :created, location: @reservation }
      else
        format.html { render :new }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservations/1
  # PATCH/PUT /reservations/1.json
  # Actualiza una reserva
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to @reservation, notice: 'Reservation was successfully updated.' }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  # Elinima una reserva
  def destroy
    
    respond_to do |format|
      @reservation.isActive = false;
      @reservation.update(@reservation);
      format.html { redirect_to reservations_url, notice: 'La reserva se cancelo correctamente' }
      format.json { head :no_content }
    end
  end

  private
    # Usa los callbacks para compartir la configuración común o las restricciones entre las acciones.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Especifica los parametros permitidos en las peticiones
    def reservation_params
      params.require(:reservation).permit(:dateOfReservation, :timeOfReservation, :isActive, :price, :user_id, :soccer_court_id, :date)
    end
end
