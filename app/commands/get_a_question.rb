class GetAQuestion
  prepend SimpleCommand

  def initialize(redis, token, question_id, answer_index)
    @token = token
    @question = question_id.to_i
    @answer = answer_index.to_i
    @redis = redis
    unless redis.has_key?(token)
      hash = {1 => nil, 2 => nil, 3 => nil, 4 => nil}
      @redis[token] = hash
    end
  end

  def call
    hash = redis[token]
    unless question == 1
      hash[question-1] = answer
    end
    redis[token] = hash
    puts "HERE!"
    puts redis[token]
    if question == 5
      get_by_key(calculate_result)
    else
      get_only_question
    end

  end

  private

  attr_accessor :token, :question, :answer, :redis

  def calculate_result
    hash = redis[token]
    key = 0
    hash.each do |q_id, ans_idx|
      deg = q_id - 1
      key+=ans_idx*(3**deg)
    end
    key
  end

  def get_only_question
    q = Question.find_by_id(question)
    choices = Answer.where(question_id: question)
    {question: q, choices: choices}
  end

  def get_by_key(key)
    Result.find_by_key(key).text
  end



end