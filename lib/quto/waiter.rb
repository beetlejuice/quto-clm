module Quto
  class Waiter

    DEFAULT_TIMEOUT = 5
    DEFAULT_INTERVAL = 0.2

    attr_accessor :timeout, :interval

    def initialize(opts = {})
      @timeout = opts.fetch(:timeout, DEFAULT_TIMEOUT)
      @interval = opts.fetch(:interval, DEFAULT_INTERVAL)
    end

    def until(exp_result = nil, &block)
      time = Time.now + timeout
      while Time.now <= time do
        act_result = block.call # block is obligatory here because of comparison
        if exp_result.nil?
          return true if act_result
        else
          return true if act_result == exp_result
        end
        # return true if act_result == exp_result
        sleep(interval)
      end
      false
    end
  end
end