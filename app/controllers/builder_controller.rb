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
        # Tells the template how to reach its resources
        # The template should be using this for every http request
        @path = '/templates/zach'
        @homeSection = Section.where(user_id: current_user.id).first

        @nameField = { text: '' }
        @phoneNumberField = { text: '' }
        @emailField = { text: '' }
        @tagline1Field = { text: '' }
        @tagline2Field = { text: '' }
        @tagline3Field = { text: '' }
        @linkedInField = { text: '' }
        @githubField = { text: '' }
        @blogField = { text: '' }
        begin
            @nameField = @homeSection.section_text_items.first
            @phoneNumberField = @homeSection.section_text_items[1]
            @emailField = @homeSection.section_text_items[2]
            @tagline1Field = @homeSection.section_text_items[3]
            @tagline2Field = @homeSection.section_text_items[4]
            @tagline3Field = @homeSection.section_text_items[5]
            @linkedInField = @homeSection.section_text_items[6]
            @githubField = @homeSection.section_text_items[7]
            @blogField = @homeSection.section_text_items[8]
        rescue
        end
        render "#{@publicPath.to_s}/#{@path}/index.html.erb", layout: false
    end

    def update
        flash[:notice] = "Updated"

    end
end
