module Quto
  class Waiter

    DEFAULT_TIMEOUT = 5
    DEFAULT_INTERVAL = 0.2

    attr_accessor :timeout, :interval

    def initialize(opts = {})
      @timeout = opts.fetch(:timeout, DEFAULT_TIMEOUT)
      @interval = opts.fetch(:interval, DEFAULT_INTERVAL)
    end

    def until(&block)
      time = Time.now + timeout
      while Time.now <= time do
        act_result = block.call
        return true if act_result
        sleep(interval)
      end
      false
    end
  end
end