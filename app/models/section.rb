class Section < ActiveRecord::Base
    belongs_to :user
    belongs_to :section_type
    has_many :section_text_items,  dependent: :destroy

    after_save :do_after_save


    def do_after_save
        # Grab all the section fields for this model and create empty
        # records for each field type
        self.section_type.section_fields.each do |field|
            model_name = "Section#{field.field_table_name.capitalize}Item"
            klass = model_name.constantize

            if klass.create(section_id: self.id, section_field_id: field.id)
                puts "[SUCCESS] #{model_name} added for section: #{self.id}"
            else
                puts "[ERROR] Could not add #{model_name} for section: #{self.id}"
            end
        end
    end
end
