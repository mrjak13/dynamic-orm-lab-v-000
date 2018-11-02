require_relative "../config/environment.rb"
require 'active_support/inflector'

class InteractiveRecord

  def self.table_name
    self.to_s.downcase.pluralize
  end

  def self.column_names
    DB[:conn].results_as_hash = true

    sql = "PRAGMA table_info('#{table_name}')"

    DB[:conn].execute(sql).map {|col| col["name"]}

    # self.column_names.each{|col_name| attr_accessor col_name.to_s}
  end

  # def add_attr_accessors
    self.column_names.each do |col_name|
      binding.pry
      attr_accessor col_name.to_s
    end
    
  



end
