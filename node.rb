# Node
class Node
  def initialize(data = 0)
    @data = data
    @next_node = nil
  end

  attr_reader :data

  attr_accessor :next_node
end
