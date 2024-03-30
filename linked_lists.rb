# LinkedList class
class LinkedList
  attr_accessor :head, :size, :list

  def initialize
    @head = nil
    @size = 0
    @list = []
  end

  def append(value)
    if @head.nil?
      @head = Node.new(value)
      @list.push(value)
    else
      current = @head
      current.next_node = value
      @list.push(current.next_node)
    end
    @size += 1
  end

  def prepend(value)
    if @head.nil?
      @head = Node.new(value)
      @list.push(value)
    else
      @list.unshift(value)
      @head.value = @list[0]
    end
    @size += 1
  end

  def tail
    @list[-1]
  end

  def at(index)
    @list[index]
  end

  def pop
    @size -= 1
    @list.pop
  end

  def contains?(value)
    puts "The list does not contain Node #{value}." if @list.include?(value) == false
    puts "The list does indeed contain Node #{value}." if @list.include?(value)
  end

  def find(value)
    @list.find_index { |element| element == value }
  end

  def to_s
    @list.each {|element| print "( #{element} ) -> "}
    p nil
  end
end

# Node class
class Node
  attr_accessor :next_node, :value

  def initialize(value = nil)
    @next_node = nil
    @value = value
  end
end

list = LinkedList.new

assigned_value = 0

5.times do
  list.prepend(assigned_value)
  assigned_value += 1
end

index = 3
p list.list
puts "List size: #{list.size}"
puts "Head node: #{list.head.value}"
puts "Tail node: #{list.tail}"
puts "Node at index #{index}: #{list.at(index)}"
list.pop
list.pop
puts "\nNew List size: #{list.size}"
p list.list
list.contains?(0)

target_value = 6
print "The index that contains Node #{target_value}: "
p list.find(target_value)
list.to_s
