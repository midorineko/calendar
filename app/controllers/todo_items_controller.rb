class TodoItemsController < ApplicationController
	before_action :set_todo_list, only: [:create, :destroy, :complete, :index]
	before_action :set_todo_item, only: [:create, :destroy, :complete]
	before_action :get_todo_items, only: [:index]
	before_action :set_day, only: [:index, :create, :destroy, :complete]
	skip_before_action :set_todo_item, only: [:create]

	def index
	end

	def create
		@todo_item = @todo_list.todo_items.create(todo_item_params)
		redirect_to day_todo_list_todo_items_path(@day, @todo_list.id)
	end

	def destroy
		if @todo_item.destroy
			flash[:success] = "Todo list item was destroyed bruh"
		else
			flash[:error] = "Todo couldn't be deleted bruv"
		end
		redirect_to day_todo_list_todo_items_path(@day, @todo_list.id)
	end

	def complete
		@todo_item.update_attribute(:completed_at, Time.now)
		redirect_to day_todo_list_todo_items_path(@day, @todo_list.id)
	end

	private

	def get_todo_items
		@todo_items = TodoList.find(params[:todo_list_id]).todo_items
	end

	def set_todo_list
		@todo_list = TodoList.find(params[:todo_list_id])
	end

	def set_day
		@day = Day.find(params[:day_id])
	end

	def set_todo_item
		@todo_item = @todo_list.todo_items.find(params[:id])
	end

	def todo_item_params
		params[:todo_item].permit(:content)
	end
end
