require 'facilethings/base'

module Facilethings	
	class WeeklyInfo < Facilethings::Base
    attr_reader :goal_worked_the_most, :area_worked_the_most, :ok
    attr_integer :important_stuff, :completed_projects, :collected_stuff, :prev_collected_stuff, :done_stuff, :prev_done_stuff
    attr_integer :collected_every, :processed_every, :done_every
    attr_float :processed_stuff, :prev_processed_stuff, :time_stuff, :prev_time_stuff 
    attr_objects :goals
	end
end
