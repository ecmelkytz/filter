class SssCategoriesController < ApplicationController
  layout 'sss'
  before_action :set_sss_category, only: [:show, :edit, :update, :destroy]

  # GET /sss_categories
  # GET /sss_categories.json
  def index
    @sss_categories = SssCategory.all
  end

  # GET /sss_categories/1
  # GET /sss_categories/1.json
  def show
  end

  # GET /sss_categories/new
  def new
    @sss_category = SssCategory.new
  end

  # GET /sss_categories/1/edit
  def edit
  end

  # POST /sss_categories
  # POST /sss_categories.json
  def create
    @sss_category = SssCategory.new(sss_category_params)

    respond_to do |format|
      if @sss_category.save
        format.html { redirect_to @sss_category, notice: 'Sss category was successfully created.' }
        format.json { render :show, status: :created, location: @sss_category }
      else
        format.html { render :new }
        format.json { render json: @sss_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sss_categories/1
  # PATCH/PUT /sss_categories/1.json
  def update
    respond_to do |format|
      if @sss_category.update(sss_category_params)
        format.html { redirect_to @sss_category, notice: 'Sss category was successfully updated.' }
        format.json { render :show, status: :ok, location: @sss_category }
      else
        format.html { render :edit }
        format.json { render json: @sss_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sss_categories/1
  # DELETE /sss_categories/1.json
  def destroy
    @sss_category.destroy
    respond_to do |format|
      format.html { redirect_to sss_categories_url, notice: 'Sss category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sss_category
      @sss_category = SssCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sss_category_params
      params.require(:sss_category).permit(:sss_id, :category_id)
    end
end
