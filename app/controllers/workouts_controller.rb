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

  def edit
    if user_check
      @workout = Workout.find_by_id(params[:id])
    else
      flash[:notice] = "Cannot edit other workouts"
    end
  end

  def update
    if user_check
      @workout = Workout.find_by_id(params[:id])
      @workout.update(workout_params)
      redirect_to workout_path
    else
      flash[:error] = "Cannot edit others workouts"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    if user_check
      @workout = Workout.find_by_id(params[:id])
      @workout.destroy
      redirect_to(workouts_path)
    else
      flash[:error] = "Cannot delete other workouts"
      redirect_to root_path
    end
  end

  def user_check
    @workout = Workout.find_by_id(params[:id])
    if current_user.id === @workout.user_id
      true
    else
      false
    end
  end

  private

  def workout_params
  params.require(:workout).permit(:workout_type, :exercises, :experience, :user_id)
  end



end
