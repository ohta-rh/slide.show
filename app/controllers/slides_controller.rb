class SlidesController < ApplicationController
  def index
    @slides = ::Slide.all
  end

  def edit
    @slide = ::Slide.find params[:id]
  end
  def new
    @slide = ::Slide.new
  end

  def show
    @slide = ::Slide.find(params[:id])
  end

  def create
    @slide = ::Slide.new params[:slide]
    if @slide.valid?
      @slide.save
      redirect_to slides_path
    else
      render :new
    end
  end

  def complate
  end
end
