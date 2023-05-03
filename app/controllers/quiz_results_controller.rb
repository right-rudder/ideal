class QuizResultsController < ApplicationController
  before_action :set_quiz_result, only: %i[ show edit update destroy ]

  # GET /quiz_results or /quiz_results.json
  def index
    @quiz_results = QuizResult.all
  end

  # GET /quiz_results/1 or /quiz_results/1.json
  def show
  end

  # GET /quiz_results/new
  def new
    @quiz_result = QuizResult.new
  end

  # GET /quiz_results/1/edit
  def edit
  end

  # POST /quiz_results or /quiz_results.json
  def create
    @quiz_result = QuizResult.new(quiz_result_params)

    respond_to do |format|
      if @quiz_result.save
        format.html { redirect_to quiz_result_url(@quiz_result), notice: "Quiz result was successfully created." }
        format.json { render :show, status: :created, location: @quiz_result }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @quiz_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quiz_results/1 or /quiz_results/1.json
  def update
    respond_to do |format|
      if @quiz_result.update(quiz_result_params)
        format.html { redirect_to quiz_result_url(@quiz_result), notice: "Quiz result was successfully updated." }
        format.json { render :show, status: :ok, location: @quiz_result }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @quiz_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quiz_results/1 or /quiz_results/1.json
  def destroy
    @quiz_result.destroy

    respond_to do |format|
      format.html { redirect_to quiz_results_url, notice: "Quiz result was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quiz_result
      @quiz_result = QuizResult.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def quiz_result_params
      params.require(:quiz_result).permit(:first_name, :last_name, :email, :program, :why_pilot, :previous_training, :wings_lift, :goals, :preferred_date, :preferred_availability, :alternate_date, :alternate_availability, :comments, :phone, :learn_style, :structure, :guidance)
    end
end
