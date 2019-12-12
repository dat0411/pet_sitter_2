class PetsController < ApplicationController
  before_action :current_user_must_be_pet_owner, :only => [:show, :edit_form, :update_row, :destroy_row]

  def current_user_must_be_pet_owner
    pet = Pet.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == pet.owner
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @pets = current_user.pets.page(params[:page]).per(10)

    render("pet_templates/index.html.erb")
  end

  def show
    @pet = Pet.find(params.fetch("id_to_display"))

    render("pet_templates/show.html.erb")
  end

  def new_form
    @pet = Pet.new

    render("pet_templates/new_form.html.erb")
  end

  def create_row
    @pet = Pet.new

    @pet.name = params.fetch("name")
    @pet.category = params.fetch("category")
    @pet.note = params.fetch("note")
    @pet.photo = params.fetch("photo") if params.key?("photo")
    @pet.owner_id = params.fetch("owner_id")

    if @pet.valid?
      @pet.save

      redirect_back(:fallback_location => "/pets", :notice => "Pet created successfully.")
    else
      render("pet_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @pet = Pet.find(params.fetch("prefill_with_id"))

    render("pet_templates/edit_form.html.erb")
  end

  def update_row
    @pet = Pet.find(params.fetch("id_to_modify"))

    @pet.name = params.fetch("name")
    @pet.category = params.fetch("category")
    @pet.note = params.fetch("note")
    @pet.photo = params.fetch("photo") if params.key?("photo")
    

    if @pet.valid?
      @pet.save

      redirect_to("/pets/#{@pet.id}", :notice => "Pet updated successfully.")
    else
      render("pet_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_owner
    @pet = Pet.find(params.fetch("id_to_remove"))

    @pet.destroy

    redirect_to("/users/#{@pet.owner_id}", notice: "Pet deleted successfully.")
  end

  def destroy_row
    @pet = Pet.find(params.fetch("id_to_remove"))

    @pet.destroy

    redirect_to("/pets", :notice => "Pet deleted successfully.")
  end
end
