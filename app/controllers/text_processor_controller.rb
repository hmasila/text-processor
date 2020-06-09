class TextProcessorController < ApplicationController
	before_action :verify_input

	def first_lines
		result = @input.split(/\r?\n|\r\n?/)

	  render json: result.first(@n.to_i).join("\n"), status: 200
	rescue
		render json: {"message": 'Use the format: {"input": "text", n: num}'}, status: 400
	end

	def last_lines
		result = @input.split(/\r?\n|\r\n?/)

	  render json: result.last(@n.to_i).join(" "), status: 200
	rescue
		render json: {"message": 'Use the format: {"input": "text", n: num}'}, status: 400
	end

	private
	def verify_input
		@input = params[:input]
		@n = params[:n]

		return if @input.present? && @n.present?
		
		message = []
		message << 'Add input param to your request.' if @input.nil?
		message << 'Add n param to your request.' if @n.nil?
		
		render json: {"message": 'Add n param to your request.}'}, status: 400
		return
	end
end
