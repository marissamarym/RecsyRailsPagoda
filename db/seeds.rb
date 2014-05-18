# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
one = SectionType.create(name: "Home")
two = SectionType.create(name: "Experience")
thr = SectionType.create(name: "Project")
fou = SectionType.create(name: "Contact")

SectionField.create(section_type_id: one.id, field_table_name: 'text', label: 'name')
SectionField.create(section_type_id: one.id, field_table_name: 'text', label: 'Phone Number')
SectionField.create(section_type_id: one.id, field_table_name: 'text', label: 'email')
SectionField.create(section_type_id: one.id, field_table_name: 'text', label: 'Tagline 1')
SectionField.create(section_type_id: one.id, field_table_name: 'text', label: 'Tagline 2')
SectionField.create(section_type_id: one.id, field_table_name: 'text', label: 'Tagline 3')
SectionField.create(section_type_id: one.id, field_table_name: 'text', label: 'LinkedIn URL')
SectionField.create(section_type_id: one.id, field_table_name: 'text', label: 'Github URL')
SectionField.create(section_type_id: one.id, field_table_name: 'text', label: 'Blog URL')

SectionField.create(section_type_id: two.id, field_table_name: 'text', label: 'Job Title')
SectionField.create(section_type_id: two.id, field_table_name: 'text', label: 'Company')
SectionField.create(section_type_id: two.id, field_table_name: 'text', label: 'Location')
SectionField.create(section_type_id: two.id, field_table_name: 'text', label: 'Description')

SectionField.create(section_type_id: thr.id, field_table_name: 'text', label: 'Field')
SectionField.create(section_type_id: thr.id, field_table_name: 'text', label: 'Skills')
SectionField.create(section_type_id: thr.id, field_table_name: 'text', label: 'Best parts')

