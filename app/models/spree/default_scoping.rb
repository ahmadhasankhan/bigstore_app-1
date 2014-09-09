# require 'active_record'
# require 'sqlite3'

# class SpreeTenanting
#   def self.connect_with_db
#     ActiveRecord::Base.establish_connection(
#       adapter: 'sqlite3',
#       database: '../../../db/development.sqlite3',
#       host: 'localhost'
#     )
#     @connection = ActiveRecord::Base.connection
#     @tables = @connection.tables - ["schema_migrations", "tenants"]
#   end
  
#   def self.list_all_tables
#     puts @tables
#   end

#   def self.get_decorator_file_name(table_name)
#     "#{table_name.gsub("spree_", "").classify.underscore}_decorator.rb"
#   end

#   def self.get_class_content(table_name)
#     "Spree::#{table_name.gsub("spree_", "").classify}.class_eval do\n  default_scope -> { where(tenant_id: Tenant.current_id) if Tenant.current_id }\nend"
#   end

#   def self.create_file
#     @tables.each do |table|
#       file_name = get_decorator_file_name(table)
#       content = get_class_content(table)
#       begin
#         File.open(file_name, 'wb') do |file|
#           file.puts content
#         end
#       rescue
#         puts "Error Creating file, maybe a file already exists with the name"
#       end
#     end
#   end

#   def self.update_tenant_id_for_all
#     @tables.each do |table|
#       begin
#         table.gsub("spree_", 
# end

# SpreeTenanting.connect_with_db
