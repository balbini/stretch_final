class AddParamsToWorkouts < ActiveRecord::Migration[5.1]
  def change
    add_column :workouts, :workout_type, :string
    add_column :workouts, :exercises, :string
    add_column :workouts, :experience, :string
    add_column :workouts, :user_id, :integer
  end
end
