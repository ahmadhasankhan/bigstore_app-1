class Tenant < ActiveRecord::Base

  # has_many :users, dependent: :destroy, class_name: "Spree::User"
  after_create :set_subdomain
  after_create :set_current_tenant_id
  after_create :set_admin_role_to_tenant

  
  validates_uniqueness_of :name


  def self.current_id=(id)
    Thread.current[:tenant_id] = id
  end

  def self.current_id
    Thread.current[:tenant_id]
  end

  def self.current_table_name=(table_name)
    Thread.current[:table_name] = table_name
  end

  def self.current_table_name
    Thread.current[:table_name]
  end
  
  # Put the subdomain name as store name
  def set_subdomain
    self.subdomain = self.name
    self.save!
  end

  # Set the id as a current tenant id 
  def set_current_tenant_id
    Tenant.current_id = self.id
  end

  # Set admin role to tenant
  def set_admin_role_to_tenant
    role = Spree::Role.create!(name: 'admin')
  end

  # create a store admin
  def self.create_store_tenant(t_email, password)
    role = Spree::Role.first
    role.users.create!(email: t_email, password: password)
    role.users.first.generate_spree_api_key!
  end

  def self.store_subdomain
    tenant = Tenant.current_id
    current_tenant = Tenant.find_by_id(tenant)
    if current_tenant.subdomain.present?
      current_tenant.subdomain
    end
  end

  def self.store_domain
    tenant = Tenant.current_id
    current_tenant = Tenant.find_by_id(tenant)
    if current_tenant.domain.present?
      current_tenant.domain
    end
  end
end
