class Queue
    def initialize(layers)
      @layers = layers
    end

    def enqueue(el)
      # adds an element to the queue
      @layers << el
    end

    def dequeue
      # removes one element from the queue
      @layers.shift
      @layers
    end

    def peek
      # returns, but doesn't remove, the top element in the queue
      @layers[0]
    end

end