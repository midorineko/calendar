class DaysController < ApplicationController
	def index
		sun = {name: 'Sunday', day: 'none'}
		mon = {name: 'Monday', day: 'none'}
		tue = {name: 'Tuesday', day: 'none'}
		wed = {name: 'Wednesday', day: 'none'}
		thu = {name: 'Thursda', day: 'none'}
		fri = {name: 'Friday', day: 'none'}
		sat = {name: 'Sunday', day: 'none'}
		@days = [sun, mon, tue, wed, thu, fri, sat]
		today = Time.now
	end
end
