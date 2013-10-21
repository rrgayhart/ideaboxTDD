require_relative 'idea'

class IdeaStore

  def self.delete_all
    @all = []
  end

  def self.all
    @all ||= []
  end

  def self.delete(id)
    self.find(id)
    self.all.reject!{|total| total.id == id}
  end
  
  def self.save(idea)
    if idea.id
      self.update(idea)
    else
      idea.id = next_id
      self.all << idea
      idea.id
    end
  end

  def self.update(idea)
    self.all.reject!{|total| total.id == idea.id}
    self.all << idea
  end

  def self.find(id)
    all[id]
  end

  def self.next_id
    self.all.size ||= 0
  end

  def self.count
    @all.length
  end
end
