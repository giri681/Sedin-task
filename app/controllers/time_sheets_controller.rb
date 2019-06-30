class TimeSheetsController < ApplicationController

  def index
		@time_sheets = TimeSheet.includes(:project).all
	end
	
	def new
  	@time_sheet = TimeSheet.new
  	@projects = Project.all
	end

	def create

  	projects = params[:projects]
  	times = params[:time]
 		descriptions = params[:description]

    time_sheets = []

    projects.each_with_index do |value, key|

      project_time = times[key]
      description = descriptions[key]

      time_sheet = TimeSheet.new

      time_sheet.project_id = value
      time_sheet.project_time = project_time
      time_sheet.description = description

      time_sheets << time_sheet
    end

    TimeSheet.import time_sheets

    redirect_to time_sheets_path
	end
end
