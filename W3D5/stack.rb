class Stack
    def initialize(layers)
      # create ivar to store stack here!
      @layers = layers
    end

    def push(el)
      # adds an element to the stack
      @layers << el
    end

    def pop
      # removes one element from the stack
      @layers.pop
      @layers
    end

    def peek
      # returns, but doesn't remove, the top element in the stack
      @layers[@layers.length - 1]
    end

end