module Api
  module V1
    class BooksController < ApplicationController

      def index
        books = Book.order('Created_at DESC');
        render json: {status: 'SUCCESS', message:'Loaded books', data:books}, status: :ok
      end

      def show
        book = Book.find(params[:id])
        render json: {status: 'SUCCESS', message:'Book loaded', data:book}, status: :ok 
      end

      def create 
        book = Book.new(book_params)

        if book.save
          render json: {status: 'SUCCESS', message:'Book is saved', data:book}, status: :ok 
        else
          render json: {status: 'ERROR', message:'Book not saved', data:book.errors}, status: :unprocessable_entity 
        end
      end

      def destroy
        book = Book.find(params[:id])
        book.destroy
        render json: {status: 'SUCCESS', message:'Deleted book', data:book},status: :ok
      end

      def update
        book = Book.find(params[:id])

        if book.update_attributes(book_params)
          render json: {status: 'SUCCESS', message:'Book Updated', data:book}, status: :ok 
        else
          render json: {status: 'ERROR', message:'Book not Updated', data:book.errors}, status: :unprocessable_entity 
        end

      end

      private
        def book_params
          params.permit(:title, :quote)
        end

    end
  end

end
