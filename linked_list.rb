require "pry"

class LinkedList

  def initialize
    @head = nil
  end

  def append(value)
    
    if @head
     find_final.link = Node.new(value)
    
    else
      @head = Node.new(value)
  
    end

  end

  def preppend(value)
    if @head

      node = Node.new(value)
      node.link = @head
      @head = node

    else
    @head = Node.new(value) 
    end
  end


  def tail
  
    puts "This is the tail of the list: #{find_final.value}"
  
  end

  def find_final
    node = @head

    return node if  !node.link
    return node if !node.link while (node = node.link)
  end

  def size
    node = @head
    size= 0

    if @head
      while node
        size =size +1
        node = node.link
      end
    
    end
      puts "The size of the list is #{size}" 
      @@size = size
    return size
  end

  def head
    if @head
      puts "This is the head value of this list #{@head.value}"
    else
      puts "There is not any instance of this List"
    end
  end

  def at(index)
    a = index.to_i
    puts "There is not value at the index #{index}" if @@size-1 < a
    node = @head
     
      while node
        
        puts "At index #{index}, the node is #{node.value}" if a == 0 
        a -= 1
        node = node.link
        
      end
  end

  def pop
    node = @head
    index = @@size-2
    while node
      node.link =nil if index == 0
      node = node.link
      index -= 1
      
    end
  end

  def contains?(value)

    node = @head
      while node
        puts "true" if node.value == value
        node=node.link
      end
      
      puts "false"

  end

  def to_s
    node = @head
    print "( #{node.value} ) -> "
    
    print "( #{node.value} ) -> " while node = node.link
      if node == nil
        print " nil \n"
      end
  end

end



class Node

  attr_reader :value
  attr_accessor :link

  def initialize(value=nil, link=nil)
    @value = value
    @link = link
  end
end


list = LinkedList.new

list.append(20)
list.append(35)
list.append(50)
list.append(60)
list.preppend(5)
list.preppend(15)


list.size
list.to_s

list.head

list.tail

list.at(2)
list.at(5)
list.at(0)
list.at(4)

list.pop
list.to_s

list.contains?(60)
list.contains?(100)