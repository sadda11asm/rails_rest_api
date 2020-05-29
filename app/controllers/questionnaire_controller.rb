class QuestionnaireController < ApplicationController

  def initialize
    super
    @redis = Rails.application.config.redis
  end
  def get
    command = GetAQuestion.call(@redis, @token, params[:question_id], params[:answer_id])
    if command.success?
      # @redis = command.result["redis"]
      render json: command.result
    else
      render json: { error: command.errors }, status: 400
    end
  end
end