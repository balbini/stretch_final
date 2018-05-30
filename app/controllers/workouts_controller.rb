class WorkoutController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]

  def index
    @workouts = Workout.all
  end

  def new
    @workout = Character.new
  end

  def create
    @workout = Workout.new(workout_params)
    if @character.save
      redirect_to workouts_path
    else
      flash[:error] = "Your character was not saved"
    end
  end

  def show
      @workout = Workout.find_by_id(params[:id])
  end


  private

  def workout_params
  params.require(:workout).permit(:workout_type, :exercises, :experience, :user_id)
end



end
