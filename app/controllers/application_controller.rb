class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
    if resource_class == User
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name,
                                                        :postal_code,
                                                        :prefecture_code,
                                                        :address_city,
                                                        :address_street,
                                                        :address_building,
                                                        :admin])
    elsif resource_class == Producer
      devise_parameter_sanitizer.permit(:sign_up, keys: [:producer_name,
                                                        :producer_postal_code,
                                                        :producer_prefecture_code,
                                                        :producer_address_city,
                                                        :producer_address_street,
                                                        :producer_address_building,
                                                        :admin])
    else
      super
    end
  end
end
