class Day < ActiveRecord::Base
	has_many :todo_lists
	has_many :todo_items, through: :todo_lists
end
