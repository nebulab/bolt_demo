# This migration comes from solidus_bolt (originally 20220531075527)
class UpdateBoltConfigurationEnvironmentColumnRestrictions < ActiveRecord::Migration[6.1]
  def change
    remove_column :solidus_bolt_bolt_configurations, :environment, :integer
    add_column :solidus_bolt_bolt_configurations, :environment, :integer, null: false, default: 1
  end
end
