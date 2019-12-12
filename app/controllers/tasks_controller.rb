class TasksController < ApplicationController
  def index
    @tasks = Task.page(params[:page]).per(10)

    render("task_templates/index.html.erb")
  end

  def show
    @task = Task.find(params.fetch("id_to_display"))

    render("task_templates/show.html.erb")
  end

  def new_form
    @task = Task.new

    render("task_templates/new_form.html.erb")
  end

  def create_row
    @task = Task.new

    @task.name = params.fetch("name")
    @task.description = params.fetch("description")
    @task.finished = params.fetch("finished")
    @task.deadline = params.fetch("deadline")
    @task.relationship_id = params.fetch("relationship_id")

    if @task.valid?
      @task.save

      redirect_back(:fallback_location => "/tasks", :notice => "Task created successfully.")
    else
      render("task_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_relationship
    @task = Task.new

    @task.name = params.fetch("name")
    @task.description = params.fetch("description")
    @task.finished = params.fetch("finished")
    @task.deadline = params.fetch("deadline")
    @task.relationship_id = params.fetch("relationship_id")

    if @task.valid?
      @task.save

      redirect_to("/relationships/#{@task.relationship_id}", notice: "Task created successfully.")
    else
      render("task_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @task = Task.find(params.fetch("prefill_with_id"))

    render("task_templates/edit_form.html.erb")
  end

  def update_row
    @task = Task.find(params.fetch("id_to_modify"))

    @task.name = params.fetch("name")
    @task.description = params.fetch("description")
    @task.finished = params.fetch("finished")
    @task.deadline = params.fetch("deadline")
    @task.relationship_id = params.fetch("relationship_id")

    if @task.valid?
      @task.save

      redirect_to("/tasks/#{@task.id}", :notice => "Task updated successfully.")
    else
      render("task_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_relationship
    @task = Task.find(params.fetch("id_to_remove"))

    @task.destroy

    redirect_to("/relationships/#{@task.relationship_id}", notice: "Task deleted successfully.")
  end

  def destroy_row
    @task = Task.find(params.fetch("id_to_remove"))

    @task.destroy

    redirect_to("/tasks", :notice => "Task deleted successfully.")
  end
end
