class PagesController < ApplicationController
  before_filter :find_slide

  def show
    @page = @slide.pages.find params[:id]
  end

  def new
    @page = @slide.pages.build
  end

  def edit
    @page = @slide.pages.find params[:id]
  end

  def update
    @page = @slide.pages.find params[:id]
    @page.attributes = params[:page]

    if @page.valid?
      @page.save validate: false
      redirect_to edit_slide_path( @slide )
    else
      render "edit"
    end
  end

  def create
    @page = @slide.pages.build
    @page.attributes = params[:page]

    if @page.valid?
      @page.save validate: false
      redirect_to edit_slide_path( @slide )
    else
      render "new"
    end
  end
  private
  def find_slide
    @slide = ::Slide.find params[:slide_id]
  end
end
