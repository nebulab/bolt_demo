# This migration comes from solidus_bolt (originally 20220530102107)
class RenameBoltConfigurationMerchantIdToDivisionPublicId < ActiveRecord::Migration[6.1]
  def change
    rename_column :solidus_bolt_bolt_configurations, :merchant_id, :division_public_id
  end
end
