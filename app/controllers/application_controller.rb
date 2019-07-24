class ApplicationController < ActionController::Base

# deviseの機能にnameの取り扱いを追加する
	before_action :configure_permitted_parameters, if: :devise_controller?
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
	end

# ログイン後に遷移するpathを設定
	def after_sign_in_path_for(resource)
		user = current_user
		user_path(user.id)
	end
end
