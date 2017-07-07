class RegisteredAppsController < ApplicationController

  def index
    @registered_apps = current_user.registered_apps
  end

  def show
    @registered_app = RegisteredApp.find(params[:id])
  end

  def new
    @registered_app = RegisteredApp.new
  end

  def create
    @registered_app = current_user.registered_apps.new(app_params)
    if @registered_app.save
      flash[:notice] = "Application was registered."
      redirect_to root_path
    else
      flash.now[:alert] = "There was an error registering your application. (Duplicate urls for the same user are not allowed.)"
      render :new
    end
  end

  def destroy
    @registered_app = RegisteredApp.find(params[:id])

    if @registered_app.destroy
      flash[:notice] = "#{@registered_app.name} was deleted."
      redirect_to root_path
    else
      flash.now[:alert] = "There was a problem deleting #{@registered_app.name}."
      redirect_to root_path
    end
  end

  private
  def app_params
    params.require(:registered_app).permit(:name, :url)
  end
end
