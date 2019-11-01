class Map
    def initialize(places)
      # create ivar to store stack here!
      @places = places
    end

    def set(key, value)
      self.each do |place|
        if place[0] == key
            place[1] = value
        end
      end
      self << [key, value]
    end

    def get(key)
      self.each do |place|
        if place[0] == key
            return place[1]
        end
      end
    end

    def delete(key)
      self.each_with_index do |place, i|
        if place[0] == key
            return self.slice!(i)
        end
      end
    end

    def show
        @self
    end

end