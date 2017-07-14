class RegisteredAppsController < ApplicationController

  def index
    @registered_apps = current_user.registered_apps
    @registered_app = RegisteredApp.new
  end

  def show
    @registered_app = RegisteredApp.find(params[:id])
    @events = @registered_app.events.group_by(&:name)
  end

  def new
    @registered_app = RegisteredApp.new
  end

  def create
    @registered_app = current_user.registered_apps.new(app_params)
    if @registered_app.save
      flash[:notice] = "Application was registered."
    else
      flash.now[:alert] = "There was an error registering your application. (Duplicate urls for the same user are not allowed.)"
    end
  end

  def edit
    @registered_app = RegisteredApp.find(params[:id])
  end

  def update
    @registered_app = RegisteredApp.find(params[:id])

    if @registered_app.update(app_params)
      flash[:notice] = "Application registration was updated successfully."
      render :show
    else
      flash.now[:alert] = "Error updating application registration. Please try again."
      redirect_to root_path
    end
  end

  def destroy
    @registered_app = RegisteredApp.find(params[:id])

    if @registered_app.destroy
      flash[:notice] = "#{@registered_app.name} was deleted."
    else
      flash.now[:alert] = "There was a problem deleting #{@registered_app.name}."
    end
  end

  private
  def app_params
    params.require(:registered_app).permit(:name, :url)
  end
end
