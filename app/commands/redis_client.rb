class RedisClient
  prepend SimpleCommand

  def initialize
    @redis = Hash.new
  end

  def set(token, hash)
    @redis[token] = hash.to_json
  end

  def get(token)
    unless @redis.has_value?(token)
      return false
    end
    JSON.parse(@redis[token])
  end

  # def is_here?(token)
  #   @redis.exists(token)
  # end
end