class Day < ActiveRecord::Base
	has_many :todo_lists
	has_many :todo_items, through: :todo_lists

	def has_todo_lists
		if todo_lists.length === 0
			return false
		else
			return true
		end
	end
end
