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

    def add_section
        section_type_id = params[:section_type_id]
        section_type = SectionType.where(id: params[:section_type_id]).first
        if section_type
            section = Section.new(
               section_type_id: section_type.id,
               user_id: current_user.id
            )
            if section.save
                flash[:notice] = "Section added!!"
            else
                flash[:alert] = "Section could not be added :*("
            end
        else
            flash[:alert] = "Not a valid section type"
        end
        redirect_to action: :index
    end
end
