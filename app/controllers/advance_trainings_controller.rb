class AdvanceTrainingsController < ApplicationController
  before_action :set_advance_training, only: %i[ show edit update destroy ]

  def advanced_training
  end


  def certified_flight_instructor
  end

  def commercial_rating
  end

  def multi_engine_rating
  end

  def instrument_rating
    @advance_training = AdvanceTraining.new
  end


  # GET /advance_trainings or /advance_trainings.json
  def index
    @advance_trainings = AdvanceTraining.all
  end

  # GET /advance_trainings/1 or /advance_trainings/1.json
  def show
  end

  # GET /advance_trainings/new
  def new
    @advance_training = AdvanceTraining.new
    #@certificate_sought = params[:certificate_sought]
    #@certificate_sought_path = "#{params[:certificate_sought]}_path"
  end

  # GET /advance_trainings/1/edit
  def edit
  end

  # POST /advance_trainings or /advance_trainings.json
  def create
    @advance_training = AdvanceTraining.new(advance_training_params)
    #@certificate_sought = advance_training_params[:certificate_sought]
  
    respond_to do |format|
      if @advance_training.save
        #redirect_path = case @certificate_sought
        #                when "certified_flight_instructor"
        #                  certified_flight_instructor_path
        #                when "commercial_rating"
        #                  commercial_rating_path
        #                when "multi_engine_rating"
        #                  multi_engine_rating_path
        #                when "instrument_rating"
        #                  instrument_rating_path
        #                else
        #                  root_path
        #                end
        format.html { redirect_to advanced_training_confirmation_path, notice: @advance_training[:first_name], alert: @advance_training[:certificate_sought] }
        format.json { render :show, status: :created, location: @advance_training }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @advance_training.errors, status: :unprocessable_entity }
      end
    end
  end
  
  

  # PATCH/PUT /advance_trainings/1 or /advance_trainings/1.json
  def update
    respond_to do |format|
      if @advance_training.update(advance_training_params)
        format.html { redirect_to advance_training_url(@advance_training), notice: "Advance training was successfully updated." }
        format.json { render :show, status: :ok, location: @advance_training }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @advance_training.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /advance_trainings/1 or /advance_trainings/1.json
  def destroy
    @advance_training.destroy

    respond_to do |format|
      format.html { redirect_to advance_trainings_url, notice: "Advance training was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_advance_training
      @advance_training = AdvanceTraining.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def advance_training_params
      params.require(:advance_training).permit(:first_name, :last_name, :email, :phone, :comments, :certificate_sought)
    end
end
