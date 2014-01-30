# = Informations
#
# == License
#
# Ekylibre - Simple ERP
# Copyright (C) 2009-2012 Brice Texier, Thibaud Merigon
# Copyright (C) 2012-2014 Brice Texier, David Joulin
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see http://www.gnu.org/licenses.
#
# == Table: products
#
#  address_id               :integer
#  born_at                  :datetime
#  category_id              :integer          not null
#  content_indicator_name   :string(255)
#  content_indicator_unit   :string(255)
#  content_maximal_quantity :decimal(19, 4)   default(0.0), not null
#  content_nature_id        :integer
#  created_at               :datetime         not null
#  creator_id               :integer
#  dead_at                  :datetime
#  default_storage_id       :integer
#  derivative_of            :string(120)
#  description              :text
#  father_id                :integer
#  financial_asset_id       :integer
#  id                       :integer          not null, primary key
#  identification_number    :string(255)
#  initial_arrival_cause    :string(120)
#  initial_container_id     :integer
#  initial_owner_id         :integer
#  initial_population       :decimal(19, 4)   default(0.0)
#  lock_version             :integer          default(0), not null
#  mother_id                :integer
#  name                     :string(255)      not null
#  nature_id                :integer          not null
#  number                   :string(255)      not null
#  parent_id                :integer
#  picture_content_type     :string(255)
#  picture_file_name        :string(255)
#  picture_file_size        :integer
#  picture_updated_at       :datetime
#  reservoir                :boolean          not null
#  tracking_id              :integer
#  type                     :string(255)
#  updated_at               :datetime         not null
#  updater_id               :integer
#  variant_id               :integer          not null
#  variety                  :string(120)      not null
#  work_number              :string(255)
#
class Plant < Bioproduct
  enumerize :variety, in: Nomen::Varieties.all(:plant), predicates: {prefix: true}
  #[VALIDATORS[ Do not edit these lines directly. Use `rake clean:validations`.
  #]VALIDATORS]

  has_shape

  before_validation :set_name_and_number, on: :create

  #return all Plant object who is alive in the considers campaigns
  scope :of_campaign, lambda { |campaign|
    raise ArgumentError.new("Expected Campaign, got #{campaign.class.name}:#{campaign.inspect}") unless campaign.is_a?(Campaign)
    stopped_on = Date.new(campaign.harvest_year.to_f, 12, 31)
    where('(dead_at <= ? OR dead_at IS NULL)', stopped_on)
  }

  # Sets nature and variety from variant
  def set_name_and_number
    if self.default_storage and self.variant and self.name.blank?
      self.name = self.variant.name + " - " + self.default_storage.name
      self.work_number = "PLANT-" + self.born_at.to_s
    end
  end

end
