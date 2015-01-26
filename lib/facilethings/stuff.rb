require 'facilethings/base'

module Facilethings	
	class Stuff < Facilethings::Base
    attr_reader :created_at
    attr_accessor :text, :state, :finished, :reminder, :time, :energy, :priority, :task_id, :project_id,
    	:actioned_at, :done_at, :important, :parent_id, :person_id, :child_id, :origin, :start_at,
	    :before_id, :after_id, :deadline, :goal_id, :area_id

  protected
  	def resource_path
    	"/#{VERSION_URL}/stuff"
  	end
	end
end
