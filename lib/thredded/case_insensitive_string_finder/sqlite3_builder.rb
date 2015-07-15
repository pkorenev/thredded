module Thredded
  class CaseInsensitiveStringFinder
    module Sqlite3Builder
      # @param [String, Array<String>] values
      # @return [ActiveRecord::Relation]
      def find(values)
        scope.where("lower(#{column}) IN (?)", Array(values).map(&:downcase))
      end
    end
  end
end