class ApplicationController < ActionController::Base


  def check_is_admin?
    unless current_user.is_admin == true
      flash[:danger] = "Vous n'êtes pas autoriser à acceder à cette page"
      redirect_to events_path, alert: "Vous n'etes pas administrateur du site !"
    end
  end

end
