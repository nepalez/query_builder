# encoding: utf-8

module QueryBuilder::CQL::Clauses

  # Describes SUPERUSER|NOSUPERUSER clauses in a CREATE USER statement
  #
  # @example
  #   Superuser.new.to_s                # => "SUPERUSER"
  #   Superuser.new(reverse: true).to_s # => "NOSUPERUSER"
  #
  class Superuser < Base

    unique
    type :superuser
    attribute :reverse, default: false

    # Returns the CQL representation of the clause
    #
    # @return [String]
    #
    def to_s
      "#{maybe_no}SUPERUSER"
    end

    private

    def maybe_no
      "NO" if reverse
    end

  end # class Superuser

end # module QueryBuilder::CQL::Clauses
