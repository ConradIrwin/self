class Object
  # Returns an object that lets you access instance variables of and call
  # private methods on this Object.
  #
  # @example
  #
  #   class House
  #     def initialize(windows)
  #       @windows = windows
  #     end
  #
  #     private
  #
  #     def window_cleaning_bill
  #       @windows * 10.00
  #     end
  #   end
  #
  #   h = House.new(4)
  #   h.self.windows
  #   # => 4
  #   h.self.windows = 6
  #   # => 6
  #   h.self.window_cleaning_bill
  #   # => 60.0
  #
  def self
    ivars = instance_variables.map{ |x| x.to_s.sub('@', '') }
    methods = (protected_methods - Object.protected_instance_methods) + (private_methods - Object.private_instance_methods)

    Class.new do
      define_method(:initialize) { |_self| @self = _self }
      define_method(:inspect) { "#{@self.inspect}.self" }

      methods.each do |method|
        define_method(method) { |*a, &b| @self.send(method, *a, &b) }
      end

      ivars.each do |ivar|
        define_method(ivar) { @self.instance_variable_get '@' + ivar }
        define_method(ivar + '=') { |value| @self.instance_variable_set '@' + ivar, value }
      end
    end.new(self)
  end
end
