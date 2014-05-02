require 'spree/support'
DeviseController.class_eval do
  include CurrentTenant
  prepend_around_filter :scope_current_tenant
end
