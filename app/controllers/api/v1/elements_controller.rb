module Api
  module V1
    class ElementsController < ApplicationController
      helper_method :element 
    
      def index
        @elements = element.all
      end 

      def create
        @element = element.new element_params
        if @element.save
          render :create
        else
          render json: { 
            message: @element.errors.full_messages.to_sentence, 
            status: :unprocessable_entity 
          }
        end
      end 

      def update
        @element = element.find(params[:id])
        if @element.update element_params
          render :update
        else
          render json: {
            message: @element.errors.full_messages.to_sentence,
            status: :unprocessable_entity
          }
        end
      end

      def show
        @element = element.find(params[:id])
      end

      def destroy
        @element = element.find(params[:id])
        @element.destroy
      end

      private
       
        def element_params
          raise "Not Implemented"
        end

    end
  end
end
