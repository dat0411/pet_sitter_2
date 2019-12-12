class RelationshipsController < ApplicationController
  before_action :current_user_must_be_relationship_home_owner, :only => [:edit_form, :update_row, :destroy_row]

  def current_user_must_be_relationship_home_owner
    relationship = Relationship.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == relationship.home_owner
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @relationships = Relationship.all

    render("relationship_templates/index.html.erb")
  end

  def show
    @report = Report.new
    @task = Task.new
    @relationship = Relationship.find(params.fetch("id_to_display"))

    render("relationship_templates/show.html.erb")
  end

  def new_form
    @relationship = Relationship.new

    render("relationship_templates/new_form.html.erb")
  end

  def create_row
    @relationship = Relationship.new

    @relationship.home_owner_id = params.fetch("home_owner_id")
    @relationship.sitter_id = params.fetch("sitter_id")
    @relationship.start_date = params.fetch("start_date")
    @relationship.end_date = params.fetch("end_date")

    if @relationship.valid?
      @relationship.save

      redirect_back(:fallback_location => "/relationships", :notice => "Relationship created successfully.")
    else
      render("relationship_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @relationship = Relationship.find(params.fetch("prefill_with_id"))

    render("relationship_templates/edit_form.html.erb")
  end

  def update_row
    @relationship = Relationship.find(params.fetch("id_to_modify"))

    
    @relationship.sitter_id = params.fetch("sitter_id")
    @relationship.start_date = params.fetch("start_date")
    @relationship.end_date = params.fetch("end_date")

    if @relationship.valid?
      @relationship.save

      redirect_to("/relationships/#{@relationship.id}", :notice => "Relationship updated successfully.")
    else
      render("relationship_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_home_owner
    @relationship = Relationship.find(params.fetch("id_to_remove"))

    @relationship.destroy

    redirect_to("/users/#{@relationship.home_owner_id}", notice: "Relationship deleted successfully.")
  end

  def destroy_row_from_sitter
    @relationship = Relationship.find(params.fetch("id_to_remove"))

    @relationship.destroy

    redirect_to("/users/#{@relationship.sitter_id}", notice: "Relationship deleted successfully.")
  end

  def destroy_row
    @relationship = Relationship.find(params.fetch("id_to_remove"))

    @relationship.destroy

    redirect_to("/relationships", :notice => "Relationship deleted successfully.")
  end
end
