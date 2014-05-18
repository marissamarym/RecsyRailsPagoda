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
        @homeSection = Section.where(user_id: current_user.id).where(section_type_id: 1).first
        @sections = Section.order("id ASC").where(user_id: current_user.id)
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
            @nameField = @homeSection.section_text_items.where(section_field_id: 1).first
            @phoneNumberField = @homeSection.section_text_items.where(section_field_id: 2).first
            @emailField = @homeSection.section_text_items.where(section_field_id: 3).first
            @tagline1Field = @homeSection.section_text_items.where(section_field_id: 4).first
            @tagline2Field = @homeSection.section_text_items.where(section_field_id: 5).first
            @tagline3Field = @homeSection.section_text_items.where(section_field_id: 6).first
            @linkedInField = @homeSection.section_text_items.where(section_field_id: 7).first
            @githubField = @homeSection.section_text_items.where(section_field_id: 8).first
            @blogField = @homeSection.section_text_items.where(section_field_id: 9).first
        rescue
        end
        render "#{@publicPath.to_s}/#{@path}/index.html.erb", layout: false
    end

    def update
        flash[:notice] = "Updated"

    end
end
