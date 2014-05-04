class SectionsController < ApplicationController
    def create
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
        redirect_to controller: :builder, action: :index
    end

    def delete

    end
end
