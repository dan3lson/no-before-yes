class TouchpointsController < ApplicationController
  before_action :set_touchpoint, only: %i[show edit update destroy]
  before_action :set_contacts, only: %i[new edit create update]

  def index
    @touchpoints = current_user.touchpoints.latest
    @any_contacts = current_user.contacts?

    respond_to do |format|
      format.html
      format.pdf do
        @touchpoints = @touchpoints.today

        render pdf: 'file_name',
               template: 'touchpoints/index.html.erb'
      end
    end
  end

  def show
  end

  def new
    @touchpoint = current_user.touchpoints.new
  end

  def edit
  end

  def create
    @touchpoint = current_user.touchpoints.new(touchpoint_params)

    if @touchpoint.save
      flash[:success] = 'Touchpoint was successfully created.'

      redirect_to @touchpoint
    else
      render :new
    end
  end

  def update
    if @touchpoint.update(touchpoint_params)
      flash[:success] = 'Touchpoint was successfully updated.'

      redirect_to @touchpoint
    else
      render :edit
    end
  end

  def destroy
    @touchpoint.destroy
    flash[:success] = 'Touchpoint was successfully destroyed.'

    redirect_to touchpoints_url
  end

  private

  def set_touchpoint
    @touchpoint = current_user.touchpoints.find(params[:id])
  end

  def set_contacts
    @contacts = current_user.contacts.by_name
  end

  def touchpoint_params
    params.
      require(:touchpoint).
      permit(:recap, :follow_up_on, :source, :result, :user_id, :contact_id)
  end
end
