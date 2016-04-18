class TodoList < ActiveRecord::Base
	has_many :todo_items
	belongs_to :day

	def has_todo_items
		if todo_items.length === 0
			return false
		else
			return true
		end
	end
end
