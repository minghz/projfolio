class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  before_filter :init

  # GET /pages
  def index
    @pages = Page.all
  end

  # GET /pages/1
  def show
  end

  # GET /pages/new
  def new
    @page = @pageable.pages.new
    #@page = Page.new
  end

  # GET /pages/1/edit
  def edit
  end

  # POST /pages
  def create
    @page = @pageable.pages.new(params[:page])

    if @page.save
      flash[:success] = 'Page was successfully created.'
      redirect_to @pageable
    else
      flash[:error] = 'Page not created - missing something?'
      redirect_to @pageable
    end
  end

  # PATCH/PUT /pages/1
  def update
    if @page.update(page_params)
      redirect_to @page, notice: 'Page was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /pages/1
  def destroy
    @page.destroy
    redirect_to @pageable
    flash[:success] = 'Page was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find(params[:id])
    end
  
    # keep track of the owning Post through @pageable
    def init
      resource, id = request.path.split('/')[1, 2]
      @pageable = resource.singularize.classify.constantize.find(id)
    end
    # Only allow a trusted parameter "white list" through.
    def page_params
      params.require(:page).permit(:name)
    end
end
