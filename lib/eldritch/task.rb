module Eldritch
  class Task
    attr_writer :value
    attr_reader :thread

    def initialize(&block)
      @block = block
    end

    def start
      @thread = Thread.new self, &@block
    end

    def wait
      @thread.join
    end

    def value
      wait
      @value
    end
  end
end