class TasksController < ApplicationController

   def index
    @tasks = Task.all
    @check = "  "
   end


   def show
     @tasks = Task.find(params[:id])
   end

   def new
    @task = Task.new
   end

   def create
     @tasks = Task.new(task_params)
     @tasks.save
   end

   def edit
     @task = Task.find(params[:id])
   end

   def update
     @tasks = Task.find(params[:id])
     @tasks.update(task_params)
     @tasks.save
   end

   def destroy
     @task = Task.find(params[:id])
     @task.destroy
     @task.save
     redirect_to tasks_path
   end

   private

  def task_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:task).permit(:title, :details,:completed)
  end

 end
