class PagesController < ApplicationController
  before_action :set_pageable
  before_action :set_owner
  before_action :set_page, only: [:show, :update, :destroy]
  before_action :post_owner, only: [:create, :edit, :edit_all_pages, :update, :destroy]

  # GET /pages
  def index
    #@pages = Page.all
    @pages = @pageable.pages.paginate(page: params[:page],
                                          per_page: 3)

    respond_to do |format|
      format.html
      format.js
    end

  end

  # GET /pages/1
  def show
  end

  # GET /pages/new
  def new
    @page = @pageable.pages.new
    #@page = Page.new
  end

  # GET /pages/edit_all_pages
  def edit_all_pages
    @pages = @pageable.pages
  end

  # GET /pages/1/edit
  def edit
    @page = Page.find(params[:id])
  end

  # POST /pages
  def create
    @page = @pageable.pages.new(params[:page])

    if @page.save
      flash[:success] = 'Page was successfully created.'
      redirect_to post_pages_url(@pageable)
    else
      render :new
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
    flash[:success] = 'Page was successfully destroyed.'
    redirect_to post_pages_url(@pageable)
  end

  private
    # don't edit if current user not page owner
    def post_owner
      if signed_in?
        @owner = User.find(@pageable.user_id)
        if current_user?(@owner)
        else
          flash[:error] = "You are not the owner!"
          redirect_to(@pageable)
        end
      else
        flash[:error] = "You are not signed in"
        redirect_to(@pageable)
      end
    end
    # keep track of the owning Post through @pageable
    def set_pageable
      resource, id = request.path.split('/')[1, 2]
      @pageable = resource.singularize.classify.constantize.find(id)
    end

    #get the owner of the post in which the page belongs to
    def set_owner
      @owner = User.find(@pageable.user_id)
    end
    #get the current page
    def set_page
      @page = Page.find(params[:id])
    end
    # Only allow a trusted parameter "white list" through.
    def page_params
      params.require(:page).permit(:name)
    end
end
