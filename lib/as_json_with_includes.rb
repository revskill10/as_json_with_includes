require "as_json_with_includes/version"
require 'active_record'

module AsJsonWithIncludes
  module BasePatch
    def as_json(options = {})
      super(options).merge(serializable_hash(options))
    end
  end

  module CalculationsPatch
    def convert_activerecord_includes_to_json_includes(active_record_includes)
      return active_record_includes if active_record_includes.is_a? Symbol
      temp_arr = []
      temp_hash = {}
      if active_record_includes.is_a? Array
        active_record_includes.each do |item|
          temp_arr << convert_activerecord_includes_to_json_includes(item)
        end
        return temp_arr
      end
      if active_record_includes.is_a? Hash
        active_record_includes.each do |key, value|
          temp_hash[key] = {include: convert_activerecord_includes_to_json_includes(value)}
        end
        temp_hash
      end
    end

    def as_json_with_includes(options)
      active_record_includes = options[:includes]
      return as_json(options) if active_record_includes.nil?
      json_inclusions = convert_activerecord_includes_to_json_includes(active_record_includes)
      options[:include] = json_inclusions
      options[:includes] = nil
      includes(active_record_includes).as_json(options)
    end
  end
end

ActiveRecord::Base.send(:include, AsJsonWithIncludes::BasePatch)
ActiveRecord::Calculations.send(:include, AsJsonWithIncludes::CalculationsPatch)
