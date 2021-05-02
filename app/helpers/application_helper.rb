module ApplicationHelper
    def logged?
        session[:user_id].present?
    end

    def current_user
        User.find(session[:user_id])
    end
end
