require_relative "../config/environment.rb"
require 'active_support/inflector'

class InteractiveRecord

  def self.table_name
    self.to_s.downcase.pluralize
  end

  def self.column_names
    DB[:conn].results_as_hash = true

    sql = "PRAGMA table_info('#{table_name}')"

    val = DB[:conn].execute(sql).map{|col| col["name"]}

    val
  end

    self.column_names.each{|col_name| attr_accessor col_name.to_s}

  def table_name_for_insert
    self.class.table_name
  end

  def col_names_for_insert

  end
end
