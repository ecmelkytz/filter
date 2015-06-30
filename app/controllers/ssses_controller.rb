class SssesController < ApplicationController
  layout 'sss'
  before_action :set_sss, only: [:show, :edit, :update, :destroy]
  respond_to :json, :html

  # GET /ssses
  # GET /ssses.json
  def index
    @ssses = Sss.all
    respond_with(@ssses) do |format|
      format.json { render :json => @ssses }
    end
  end

  # GET /ssses/1
  # GET /ssses/1.json
  def show
  end

  # GET /ssses/new
  def new
    @sss = Sss.new
  end

  # GET /ssses/1/edit
  def edit
  end

  # POST /ssses
  # POST /ssses.json
  def create
    @sss = Sss.new(sss_params)

    respond_to do |format|
      if @sss.save
        format.html { redirect_to @sss, notice: 'Sss was successfully created.' }
        format.json { render :show, status: :created, location: @sss }
      else
        format.html { render :new }
        format.json { render json: @sss.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ssses/1
  # PATCH/PUT /ssses/1.json
  def update
    respond_to do |format|
      if @sss.update(sss_params)
        format.html { redirect_to @sss, notice: 'Sss was successfully updated.' }
        format.json { render :show, status: :ok, location: @sss }
      else
        format.html { render :edit }
        format.json { render json: @sss.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ssses/1
  # DELETE /ssses/1.json
  def destroy
    @sss.destroy
    respond_to do |format|
      format.html { redirect_to ssses_url, notice: 'Sss was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sss
      @sss = Sss.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sss_params
      params.require(:sss).permit(:question, :answer, :category_ids => [])
    end
end
