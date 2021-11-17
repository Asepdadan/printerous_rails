namespace :organization do
  desc "TODO"
  task seed_organization: :environment do

    Organization.create!([
    {
    "name": "PT ILCS",
    "phone": "082948394"
    },
    {
        "name": "PT JUngkir Balik",
        "phone": "082948394"
    },
    {
        "name": "Pt Rotok",
        "phone": "082948320494"
    },{
        "name": "PT Pan",
        "phone": "082928494"
    }
    ])

    p "Created #{Organization.count} organization"
  end

end
