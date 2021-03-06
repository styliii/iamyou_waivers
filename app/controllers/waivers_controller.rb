class WaiversController < ApplicationController
  require 'open3'
  # GET /waivers
  # GET /waivers.json
  def index
    @waivers = Waiver.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @waivers }
    end
  end

  # GET /waivers/1
  # GET /waivers/1.json
  def show
    @waiver = Waiver.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @waiver }
    end
  end

  # GET /waivers/new
  # GET /waivers/new.json
  def new
    @waiver = Waiver.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @waiver }
    end
  end

  def create
    @waiver = Waiver.new(params[:waiver])
    @waiver.full_name = params["name"]
    data = params["output"]

    instructions = JSON.parse(data).map { |h| "line #{h['mx'].to_i},#{h['my'].to_i} #{h['lx'].to_i},#{h['ly'].to_i}" } * ' '
    Open3.popen3("convert -size 1000x300 xc:transparent -stroke blue -draw @- ./app/assets/images/signature.png") do |input, output, error|
      input.puts instructions
    end

    @waiver.json_signature = instructions
    @waiver.save

    respond_to do |format|
      if @waiver.save
        WaiverMailer.waiver_confirmation(@waiver).deliver
        format.html { redirect_to @waiver, notice: 'Waiver was successfully created.' }
        format.json { render json: @waiver, status: :created, location: @waiver }
      else
        format.html { render action: "new" }
        format.json { render json: @waiver.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /waivers/1
  # PUT /waivers/1.json
  def update
    @waiver = Waiver.find(params[:id])

    respond_to do |format|
      if @waiver.update_attributes(params[:waiver])
        format.html { redirect_to @waiver, notice: 'Waiver was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @waiver.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /waivers/1
  # DELETE /waivers/1.json
  def destroy
    @waiver = Waiver.find(params[:id])
    @waiver.destroy

    respond_to do |format|
      format.html { redirect_to waivers_url }
      format.json { head :no_content }
    end
  end
end
