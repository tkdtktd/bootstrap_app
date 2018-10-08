module ApplicationHelper

  def bootstrap_class_for(flash_type)
    case flash_type
      when 'success'
        "alert-success"
      when 'error'
        "alert-danger"
      when 'alert'
        "alert-warning"
      when 'notice'
        "alert-info"
      else
        flash_type.to_s
    end
  end

  def resource_name
    :owner
  end
  
  def resource
      @resource ||= Owner.new
  end
  
  def devise_mapping
      @devise_mapping ||= Devise.mappings[:owner]
  end
  
end
