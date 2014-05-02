require 'spree/support'
Spree::Admin::UserSessionsController.class_eval do
  include CurrentTenant
  prepend_around_filter :scope_current_tenant
end
