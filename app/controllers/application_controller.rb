# frozen_string_literal: true

class ApplicationController < ActionController::API
  def render_success(result, options: {})
    render json: serialize_json(result, options), status: :ok
  end

  def render_error(result)
    render json: result.errors.messages, status: :unprocessable_entity
  end

  private

  def serialize_json(result, options = {})
    klass = result_type(result)
    klass.new(result, options)
  rescue NameError
    {}
  end

  def result_type(result)
    result = result.first if result.respond_to?(:map)
    "#{result.class.name}Serializer".constantize
  end
end
