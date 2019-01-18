class SizesController < ApplicationController
  load_and_authorize_resource

  # GET /sizes
  def index
		@sizes = Size.order(name: :asc)
  end

  # POST /sizes
  def create
    @size = Size.new(size_params)

    if @size.save
      redirect_to @size, notice: 'Size was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /sizes/1
  def update
    if @size.update(size_params)
      redirect_to @size, notice: 'Size was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /reviews/1
  def destroy
    @size.destroy
    redirect_to sizes_url, notice: 'Size was successfully destroyed.'
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def size_params
      params.require(:size).permit(:name, :text)
    end
end
