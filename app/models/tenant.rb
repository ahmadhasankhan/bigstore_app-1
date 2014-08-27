class Tenant < ActiveRecord::Base

  # has_many :users, dependent: :destroy, class_name: "Spree::User"
  after_create :set_current_tenant_id
  after_create :set_admin_role_to_tenant

  
  validates_uniqueness_of :subdomain, :name


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

  def self.create_store_admin
    Spree::User.create!()
  end
  
  # Set the id as a current tenant id 
  def set_current_tenant_id
    Tenant.current_id = self.id
  end

  # Set admin role to tenant
  def set_admin_role_to_tenant
    role = Spree::Role.create!(name: 'admin', tenant_id: self.id)
  end

  def self.create_store_tenant(tenant_id, t_email, password)
    role = Spree::Role.where(tenant_id: tenant_id).first
    role.users.create!(email: t_email, password: password) 
  end

end
