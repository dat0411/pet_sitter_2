class ReportsController < ApplicationController
  def index
    @reports = Report.all

    render("report_templates/index.html.erb")
  end

  def show
    @report = Report.find(params.fetch("id_to_display"))

    render("report_templates/show.html.erb")
  end

  def new_form
    @report = Report.new

    render("report_templates/new_form.html.erb")
  end

  def create_row
    @report = Report.new

    @report.name = params.fetch("name")
    @report.description = params.fetch("description")
    @report.photo = params.fetch("photo")
    @report.relationship_id = params.fetch("relationship_id")

    if @report.valid?
      @report.save

      redirect_back(:fallback_location => "/reports", :notice => "Report created successfully.")
    else
      render("report_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @report = Report.find(params.fetch("prefill_with_id"))

    render("report_templates/edit_form.html.erb")
  end

  def update_row
    @report = Report.find(params.fetch("id_to_modify"))

    @report.name = params.fetch("name")
    @report.description = params.fetch("description")
    @report.photo = params.fetch("photo")
    @report.relationship_id = params.fetch("relationship_id")

    if @report.valid?
      @report.save

      redirect_to("/reports/#{@report.id}", :notice => "Report updated successfully.")
    else
      render("report_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_relationship
    @report = Report.find(params.fetch("id_to_remove"))

    @report.destroy

    redirect_to("/relationships/#{@report.relationship_id}", notice: "Report deleted successfully.")
  end

  def destroy_row
    @report = Report.find(params.fetch("id_to_remove"))

    @report.destroy

    redirect_to("/reports", :notice => "Report deleted successfully.")
  end
end
