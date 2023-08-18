class AdvanceTrainingsController < ApplicationController
  before_action :set_advance_training, only: %i[ show edit update destroy ]

  # Original static page
  def advanced_training
  end


  def certified_flight_instructor
    @advance_training = AdvanceTraining.new
    @advanced_page = calculate_advanced_page(request.path)  # Calculate advanced_page value
  end

  def commercial_certificate
    @advance_training = AdvanceTraining.new
    @advanced_page = calculate_advanced_page(request.path)  # Calculate advanced_page value
  end

  def multi_engine_rating
    @advance_training = AdvanceTraining.new
    @advanced_page = calculate_advanced_page(request.path)  # Calculate advanced_page value
  end

  def instrument_rating
    @advance_training = AdvanceTraining.new
    @advanced_page = calculate_advanced_page(request.path)  # Calculate advanced_page value
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
  end

  # GET /advance_trainings/1/edit
  def edit
  end

  # POST /advance_trainings or /advance_trainings.json
  def create
    @advance_training = AdvanceTraining.new(advance_training_params)
    #@advanced_page = session[:advanced_page]  # Retrieve advanced_page value from the session
  
    respond_to do |format|
      if @advance_training.save
        # Handle successful submission
        AdvanceTrainingsMailer.advance_trainings(@advance_training).deliver_later
        format.html { redirect_to advanced_training_confirmation_path, notice: @advance_training[:first_name], alert: @advance_training[:certificate_sought] }
        format.json { render :show, status: :created, location: @advance_training }
      else
        format.html { render action: controller.controller_name } # Render the same action as the form
        format.json { render json: @advance_training.errors, status: :unprocessable_entity }
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace("advance_training_form", partial: "form", locals: { advance_training: @advance_training, advanced_page: @advanced_page })
        end
      end
    end
  end
  
  
  

  # PATCH/PUT /advance_trainings/1 or /advance_trainings/1.json
  #def update
  #  respond_to do |format|
  #    if @advance_training.update(advance_training_params)
  #      format.html { redirect_to advance_training_url(@advance_training), notice: "Advance training was successfully updated." }
  #      format.json { render :show, status: :ok, location: @advance_training }
  #    else
  #      format.html { render :edit, status: :unprocessable_entity }
  #      format.json { render json: @advance_training.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end

  # DELETE /advance_trainings/1 or /advance_trainings/1.json
  def destroy
    @advance_training.destroy

    respond_to do |format|
      format.html { redirect_to advance_trainings_url, notice: "Advance training was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def calculate_advanced_page(path)
      case path
      when instrument_rating_path
        "Instrument Rating"
      when commercial_certificate_path
        "Commercial Certificate"
      when multi_engine_rating_path
        "Multi Engine Rating"
      when certified_flight_instructor_path
        "CFI Certificate"
      else
        "Default Value"  # Set an appropriate default value
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_advance_training
      @advance_training = AdvanceTraining.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def advance_training_params
      params.require(:advance_training).permit(:first_name, :last_name, :email, :phone, :comments, :certificate_sought)
    end
end
