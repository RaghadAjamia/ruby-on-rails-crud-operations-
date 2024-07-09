class ApplicationController < ActionController::Base
    def after_sign_in_path_for(resource)
      if resource.is_a?(Admin)
        home_dashboard_path
      else
        home_userhomepage_path
      end
    end
  
    def after_sign_out_path_for(resource_or_scope)
      if resource_or_scope == :admin
        root_path
      else
        root_path
      end
    end
  end
  