class BuilderController < ApplicationController
    def initialize
        super
        @publicPath = Rails.root.join('public')
    end

    def index
        @sectionTypes = SectionType.all
        @sections = Section.where(user_id: current_user.id)
    end

    def view
    
        @name = 'Chason Choate'
        # Tells the template how to reach it's resources
        # The template should be using this for every http request
        @path = '/templates/zach'
        render "#{@publicPath.to_s}/#{@path}/index.html.erb", layout: false
    end

    def update
        flash[:notice] = "Updated"

    end
end
