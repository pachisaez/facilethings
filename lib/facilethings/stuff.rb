require 'facilethings/base'

module Facilethings	
	class Stuff < Facilethings::Base
    attr_accessor :text, :state, :finished, :time, :energy, :priority, :task_id, :project_id,
    	:important, :parent_id, :person_id, :child_id, :origin, :before_id, :after_id, :deadline, 
    	:goal_id, :area_id
	  attr_datetime :reminder, :actioned_at, :done_at, :start_at
    attr_object :project
    attr_object :person
    attr_objects :checkpoints

  protected
  	def resource_path
    	"/#{VERSION_URL}/stuff"
  	end
	end
end
