class RelationshipsController < ApplicationController
  def index
    @relationships = Relationship.all

    render("relationship_templates/index.html.erb")
  end

  def show
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

    @relationship.home_owner_id = params.fetch("home_owner_id")
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
