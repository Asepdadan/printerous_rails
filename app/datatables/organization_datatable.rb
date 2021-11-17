class OrganizationDatatable < ApplicationDatatable
  delegate :params, :h, :link_to, to: :@view

  def initialize(view)
    @view = view
    super
  end

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      id: { source: "organization.id", cond: :eq },
      name: { source: "organization.name", cond: :like, searchable: true, orderable: true },
      phone: { source: "organization.phone", cond: :like, searchable: true, orderable: true },
    }
  end

  def data
    records.map do |record|
      {
        id: record.id,
        name: record.name,
        phone: record.phone
      }
    end
  end

  def get_raw_records
    # insert query here
    Organization.all
  end

end
