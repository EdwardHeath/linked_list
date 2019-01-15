require_relative 'node'

# Linked List
class LinkedList
  def initialize
    @head = nil
    @size = 0
  end

  def append(data)
    tail.next_node = Node.new(data)
    @size += 1
  end

  def prepend(data)
    add = Node.new(data)
    add.next_node = @head
    @head = add
    @size += 1
  end

  attr_reader :size

  attr_reader :head

  def tail
    current = @head
    current = current.next_node until current.next_node.nil?
    current
  end

  def at(index)
    current_index = 0
    current = @head
    while current_index != index && !current.nil?
      current_index += 1
      current = current.next_node
    end
    current.nil? ? 'nil' : current.data
  end

  def pop
    current = @head
    current = current.next_node until current.next_node.next_node.nil?
    last = current.next_node
    current.next_node = nil
    last.data
  end

  def contains?; end

  def find(data); end

  def to_s
    current = @head
    until current.nil?
      print "( #{current.data} ) -> "
      current = current.next_node
    end
    puts 'nil'
  end
end

list = LinkedList.new

list.prepend(7) # ( 7 ) -> nil
list.prepend(8) # ( 8 ) -> ( 7 ) -> nil
list.to_s

list.append(9) # ( 8 ) -> ( 7 ) -> ( 9 ) -> nil
list.append(6) # ( 8 ) -> ( 7 ) -> ( 9 ) -> ( 6 ) -> nil
list.to_s

puts "Size: #{list.size}"

puts "Head: #{list.head.data}"

puts "Tail: #{list.tail.data}"

puts "Index 2: #{list.at(2)}"
puts "Index 4: #{list.at(4)}"

puts "Pop: #{list.pop}"
list.to_s