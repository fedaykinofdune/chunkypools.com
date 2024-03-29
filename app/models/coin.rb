class Coin
  attr_accessor :name, :code, :reward, :port, :active, :price_source, :type, :algorithm

  def initialize(options)
    @name = options[:name]
    @code = options[:code]
    @reward = options[:reward]
    @port = options[:port]
    @active = options.has_key?(:active) ? options[:active] : true
    @price_source = options[:price_source]
    @type = options[:type] || 'mpos'
    @algorithm = options[:algorithm] || 'scrypt'
  end

  # TODO: move this to config file
  CONTAINER = [
   Coin.new(name: 'Bitstar', code: 'bits', reward: 124, port: 3341),
   Coin.new(name: 'Defcoin', code: 'def', reward: 50, port: 3349),
   Coin.new(name: 'Digibyte', code: 'dgb', reward: 8000, port: 3340),
   Coin.new(name: 'Dogecoin', code: 'doge', reward: 250000, port: 22550, type: 'p2pool'),
   Coin.new(name: 'Karmacoin', code: 'karm', reward: 110000, port: 3339),
   Coin.new(name: 'Kashmircoin', code: 'ksc', reward: 0.001001, port: 3338),
   Coin.new(name: 'Muniti', code: 'mun', reward: 39, port: 1133, algorithm: 'x11'),
   Coin.new(name: 'Potcoin', code: 'pot', reward: 420, port: 3420, price_source: 'mintpal'),
   Coin.new(name: 'RonPaulCoin', code: 'rpc', reward: 1, port: 3335),
   Coin.new(name: 'Rubycoin', code: 'ruby', reward: 250, port: 3342),
   Coin.new(name: 'Spartancoin', code: 'spn', reward: 150000, port: 3348),
   Coin.new(name: 'Stoopidcoin', code: 'stp', reward: 25000, port: 3334),
   Coin.new(name: 'Whitecoin', code: 'wc', reward: 30000, port: 3337)
  ]

  def self.all
    CONTAINER
  end

  def self.[](code)
    CONTAINER.find { |c| c.code == code.downcase }
  end

  def self.active
    @active ||= CONTAINER.select(&:active)
  end

  def self.active_mpos
    CONTAINER.select { |c| c.active && c.type == 'mpos' }
  end

  def self.scrypt
    CONTAINER.select { |c| c.active && c.algorithm == 'scrypt' }
  end

  def self.x11
    CONTAINER.select { |c| c.active && c.algorithm == 'x11' }
  end
end
