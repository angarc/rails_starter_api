class ElementGenerator < Rails::Generators::NamedBase
  include Rails::Generators::Migration
  source_root File.expand_path('templates', __dir__)

  def create_files 
    template "element_controller.template", "app/controllers/api/v1/#{file_name.pluralize.underscore}_controller.rb" 
    # template "show.template", "app/views/api/v1/#{file_name.pluralize.underscore}/show.json.jbuilder"
    # template "index.template", "app/views/api/v1/#{file_name.pluralize.underscore}/index.json.jbuilder"
    # template "destroy.template", "app/views/api/v1/#{file_name.pluralize.underscore}/destroy.json.jbuilder"
    # template "update.template", "app/views/api/v1/#{file_name.pluralize.underscore}/update.json.jbuilder"
    # template "create.template", "app/views/api/v1/#{file_name.pluralize.underscore}/create.json.jbuilder"
    template "model.template", "app/models/#{file_name.singularize.underscore}.rb"
  end

  def create_migration_file
    migration_template "migration.template", "db/migrate/create_#{file_name.pluralize.underscore}.rb"
  end

  def self.next_migration_number(dir)
    if @migration_number
      @migration_number.next
    else
      @migration_number = Time.now.utc.strftime("%Y%m%d%H%M%S")
    end
  end

  def create_routes
    inject_into_file 'config/routes.rb', 
                    "      resources :#{file_name.pluralize.underscore}\n", 
                    after: "    namespace :v1 do\n"
  end
end
