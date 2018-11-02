require_relative "../config/environment.rb"
require 'active_support/inflector'

class InteractiveRecord

  def self.table_name
    self.to_s.downcase.pluralize
  end

  def self.column_names
    DB[:conn].results_as_hash = true

    sql = "PRAGMA table_info('#{table_name}')"

    info = DB[:conn].execute(sql)
    column_names = []

    info{|col| column_names << col["name"]}
    # binding.pry

  end



end
