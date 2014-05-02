class Tenant < ActiveRecord::Base
  
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
end
