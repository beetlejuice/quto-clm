module Quto
  class Waiter

    DEFAULT_TIMEOUT = 5
    DEFAULT_INTERVAL = 0.2

    def initialize(opts = {})
      @timeout = opts.fetch(:timeout, DEFAULT_TIMEOUT)
      @interval = opts.fetch(:interval, DEFAULT_INTERVAL)
    end

    def until(exp_result, &block)
      time = Time.now + @timeout
      while Time.now <= time do
        act_result = block.call if block_given?
        return true if act_result == exp_result
        sleep(@interval)
      end
      false
    end
  end
end