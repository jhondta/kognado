# frozen_string_literal: true

class Maintenance::TechinicansController < ApplicationController
  before_action :set_maintenance_techinican, only: %i[ show edit update destroy ]

  # GET /maintenance/techinicans or /maintenance/techinicans.json
  def index
    @maintenance_techinicans = Maintenance::Techinican.all
  end

  # GET /maintenance/techinicans/1 or /maintenance/techinicans/1.json
  def show
  end

  # GET /maintenance/techinicans/new
  def new
    @maintenance_techinican = Maintenance::Techinican.new
  end

  # GET /maintenance/techinicans/1/edit
  def edit
  end

  # POST /maintenance/techinicans or /maintenance/techinicans.json
  def create
    @maintenance_techinican = Maintenance::Techinican.new(maintenance_techinican_params)

    respond_to do |format|
      if @maintenance_techinican.save
        format.html { redirect_to @maintenance_techinican, notice: 'Techinican was successfully created.' }
        format.json { render :show, status: :created, location: @maintenance_techinican }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @maintenance_techinican.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /maintenance/techinicans/1 or /maintenance/techinicans/1.json
  def update
    respond_to do |format|
      if @maintenance_techinican.update(maintenance_techinican_params)
        format.html { redirect_to @maintenance_techinican, notice: 'Techinican was successfully updated.' }
        format.json { render :show, status: :ok, location: @maintenance_techinican }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @maintenance_techinican.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maintenance/techinicans/1 or /maintenance/techinicans/1.json
  def destroy
    @maintenance_techinican.destroy!

    respond_to do |format|
      format.html { redirect_to maintenance_techinicans_path, status: :see_other, notice: 'Techinican was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_maintenance_techinican
      @maintenance_techinican = Maintenance::Techinican.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def maintenance_techinican_params
      params.require(:maintenance_techinican).permit(:user_id, :specialty, :certificacion_level, :active)
    end
end
