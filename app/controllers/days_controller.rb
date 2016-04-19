class DaysController < ApplicationController
	before_action :get_week, only: [:index]
	require 'pry'

	def index
		@days = @week
		@days.map do |day|
			day_with_lists = Day.where(date: day[:name].strftime("%Y-%m-%d"))
			if day_with_lists.length > 0 && day_with_lists.first.todo_lists.length > 0
				day[:day] = day_with_lists.first.id
			end
		end

	end

	def new
		@day = Day.create(date: params[:format])
		redirect_to day_todo_lists_path(@day)
	end

	private

	def get_week
		today = Time.now
		day1 = {day: 'none'}
		day2 = {day: 'none'}
		day3 = {day: 'none'}
		day4 = {day: 'none'}
		day5 = {day: 'none'}
		day6 = {day: 'none'}
		day7 = {day: 'none'}
		@week = [day1, day2, day3, day4, day5, day6, day7]
		@week.map do |day|
			day[:name] = today
			today += 1.day
		end
	end
end
