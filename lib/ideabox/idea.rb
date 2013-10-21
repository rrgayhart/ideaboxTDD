require_relative 'idea_store'

class Idea
  include Comparable
  attr_accessor :title, :description, :rank, :id

  def initialize(*attributes)
    attributes = attributes
    @title = attributes.slice!(0)
    @description = attributes.slice!(0)
    @rank = 0
    @id ||= nil
  end

  def like!
    @rank += 1
  end

  def <=>(other)
    other.rank <=> rank
  end

end
