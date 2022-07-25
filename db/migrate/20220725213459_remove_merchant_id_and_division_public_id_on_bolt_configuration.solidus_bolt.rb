# This migration comes from solidus_bolt (originally 20220725133701)
class RemoveMerchantIdAndDivisionPublicIdOnBoltConfiguration < ActiveRecord::Migration[6.1]
  def change
    remove_column :solidus_bolt_bolt_configurations, :division_public_id, :string
    remove_column :solidus_bolt_bolt_configurations, :merchant_public_id, :string
  end
end
